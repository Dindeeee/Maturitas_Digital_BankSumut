<?php

namespace App\Http\Controllers;

use App\Models\AssessmentControlResult;
use App\Models\AssessmentPeriod;
use App\Models\Control;
use App\Models\ScoreCache;
use App\Services\ScoringService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Illuminate\View\View;

class AssessmentController extends Controller
{
    /** Periode yang sedang aktif (asumsi satu periode aktif pada satu waktu). */
    private function activePeriod(): ?AssessmentPeriod
    {
        return AssessmentPeriod::where('status', 'active')->orderByDesc('year')->first();
    }

    public function index(Request $request): View
    {
        $period = $this->activePeriod();
        $divisionId = $request->user()->division_id;

        if (! $period || ! $divisionId) {
            return view('assessment.index', [
                'period'   => $period,
                'controls' => collect(),
                'meta'     => collect(),
            ]);
        }

        $controls = Control::whereHas('divisions', fn ($q) => $q->where('divisions.id', $divisionId))
            ->with('subdomain.domain')
            ->withCount('subControls')
            ->orderBy('code')
            ->get();

        $acrs = AssessmentControlResult::where('assessment_period_id', $period->id)
            ->whereIn('control_id', $controls->pluck('id'))
            ->withCount(['subResults as filled_count' => fn ($q) => $q->whereNotNull('status')])
            ->get()->keyBy('control_id');

        $scores = ScoreCache::where('assessment_period_id', $period->id)
            ->where('scoreable_type', 'control')
            ->whereIn('scoreable_id', $controls->pluck('id'))
            ->get()->keyBy('scoreable_id');

        $meta = $controls->mapWithKeys(fn ($c) => [$c->id => [
            'filled' => $acrs[$c->id]->filled_count ?? 0,
            'total'  => $c->sub_controls_count,
            'score'  => $scores[$c->id] ?? null,
        ]]);

        return view('assessment.index', compact('period', 'controls', 'meta'));
    }

    public function show(Request $request, Control $control): View
    {
        $period = $this->activePeriod();
        abort_if(! $period, 404, 'Tidak ada periode aktif.');
        $this->authorizeControl($request, $control);

        $control->load('subControls', 'subdomain.domain');

        $acr = AssessmentControlResult::firstOrCreate(
            ['assessment_period_id' => $period->id, 'control_id' => $control->id],
            ['review_progress' => 'pending'],
        );
        $subResults = $acr->subResults()->get()->keyBy('sub_control_id');

        return view('assessment.show', compact('period', 'control', 'acr', 'subResults'));
    }

    public function store(Request $request, Control $control, ScoringService $scoring): RedirectResponse
    {
        $period = $this->activePeriod();
        abort_if(! $period, 404, 'Tidak ada periode aktif.');
        $this->authorizeControl($request, $control);

        $validated = $request->validate([
            'status'             => ['array'],
            'status.*'           => ['nullable', Rule::in(['ada', 'partial', 'tidak'])],
            'penjelasan_aktor'   => ['nullable', 'string'],
            'penjelasan_dokumen' => ['nullable', 'string'],
            'penjelasan_kontrol' => ['nullable', 'string'],
            'rekomendasi'        => ['nullable', 'string'],
            'referensi_dokumen'  => ['nullable', 'string'],
        ]);

        $acr = AssessmentControlResult::firstOrCreate(
            ['assessment_period_id' => $period->id, 'control_id' => $control->id],
            ['review_progress' => 'pending'],
        );

        $userId = $request->user()->id;
        $now = Carbon::now();

        DB::transaction(function () use ($acr, $control, $validated, $scoring, $userId, $now, $period) {
            $acr->update([
                'penjelasan_aktor'   => $validated['penjelasan_aktor'] ?? null,
                'penjelasan_dokumen' => $validated['penjelasan_dokumen'] ?? null,
                'penjelasan_kontrol' => $validated['penjelasan_kontrol'] ?? null,
                'rekomendasi'        => $validated['rekomendasi'] ?? null,
                'referensi_dokumen'  => $validated['referensi_dokumen'] ?? null,
            ]);

            foreach ($control->subControls as $sub) {
                $status = $validated['status'][$sub->id] ?? null;
                $acr->subResults()->updateOrCreate(
                    ['sub_control_id' => $sub->id],
                    [
                        'status'    => $status,
                        'skor'      => $scoring->scoreFromStatus($status),
                        'filled_by' => $status !== null ? $userId : null,
                        'filled_at' => $status !== null ? $now : null,
                    ],
                );
            }

            $scoring->calculateControl($acr->fresh('subResults'));
            $scoring->recalculateAggregates($period);
        });

        return redirect()->route('assessment.show', $control)
            ->with('success', "Isian kontrol {$control->code} tersimpan & skor diperbarui.");
    }

    /** Pastikan kontrol termasuk PIC divisi assessor. */
    private function authorizeControl(Request $request, Control $control): void
    {
        $divisionId = $request->user()->division_id;
        abort_unless(
            $divisionId && $control->divisions()->where('divisions.id', $divisionId)->exists(),
            403,
            'Kontrol ini bukan tanggung jawab divisi Anda.',
        );
    }
}
