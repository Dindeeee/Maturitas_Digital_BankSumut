<?php

namespace App\Http\Controllers;

use App\Models\AssessmentControlResult;
use App\Models\AssessmentPeriod;
use App\Models\Control;
use App\Models\Domain;
use App\Models\ScoreCache;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Validation\Rule;
use Illuminate\View\View;

class ReviewController extends Controller
{
    private function activePeriod(): ?AssessmentPeriod
    {
        return AssessmentPeriod::where('status', 'active')->orderByDesc('year')->first();
    }

    private function isReadOnly(Request $request): bool
    {
        return $request->user()->role === 'admin';
    }

    private function resolvePeriod(Request $request): ?AssessmentPeriod
    {
        $role = $request->user()->role;

        if (in_array($role, ['admin', 'approval'])) {
            if ($id = $request->integer('period')) {
                return AssessmentPeriod::whereIn('status', ['active', 'completed'])->find($id);
            }

            return AssessmentPeriod::whereIn('status', ['active', 'completed'])
                ->orderByDesc('year')->first();
        }

        return $this->activePeriod();
    }

    public function index(Request $request): View
    {
        $readOnly = $this->isReadOnly($request);
        $period   = $this->resolvePeriod($request);

        $canPickPeriod = in_array($request->user()->role, ['admin', 'approval']);
        $periods = $canPickPeriod
            ? AssessmentPeriod::whereIn('status', ['active', 'completed'])->orderByDesc('year')->get()
            : collect();

        if (! $period) {
            return view('review.index', [
                'period' => null, 'results' => collect(), 'scores' => collect(),
                'domains' => collect(), 'domainId' => null, 'periods' => $periods,
            ]);
        }

        $domainId = $request->integer('domain_id') ?: null;

        $results = AssessmentControlResult::where('assessment_period_id', $period->id)
            ->with(['control.subdomain.domain', 'reviewer'])
            ->withCount(['subResults as filled_count' => fn ($q) => $q->whereNotNull('status')])
            ->when($domainId, fn ($q) => $q->whereHas('control.subdomain', fn ($s) => $s->where('domain_id', $domainId)))
            ->get()
            ->sortBy(fn ($r) => $r->control->code)
            ->values();

        $scores = ScoreCache::where('assessment_period_id', $period->id)
            ->where('scoreable_type', 'control')
            ->get()->keyBy('scoreable_id');

        $domains = Domain::orderBy('order')->get();

        return view('review.index', compact('period', 'results', 'scores', 'domains', 'domainId', 'periods'));
    }

    public function show(Request $request, Control $control): View
    {
        $period = $this->resolvePeriod($request);
        abort_if(! $period, 404, 'Tidak ada periode assessment.');

        $acr = AssessmentControlResult::with('approver')
            ->where('assessment_period_id', $period->id)
            ->where('control_id', $control->id)
            ->firstOrFail();

        $control->load('subdomain.domain', 'subControls');
        $subResults = $acr->subResults()->with('filler')->get()->keyBy('sub_control_id');

        $score = ScoreCache::where('assessment_period_id', $period->id)
            ->where('scoreable_type', 'control')
            ->where('scoreable_id', $control->id)
            ->first();

        return view('review.show', compact('period', 'control', 'acr', 'subResults', 'score'));
    }

    public function update(Request $request, AssessmentControlResult $result): RedirectResponse
    {
        $data = $request->validate([
            'review_progress' => ['required', Rule::in(['pending', 'in_progress', 'done'])],
        ]);

        $result->update([
            'review_progress' => $data['review_progress'],
            'reviewed_by'     => $request->user()->id,
            'reviewed_at'     => Carbon::now(),
        ]);

        return redirect()->route('review.show', array_filter([
            'control' => $result->control_id,
            'period'  => $request->query('period'),
            'domain_id' => $request->query('domain_id'),
        ]))->with('success', 'Status review diperbarui.');
    }

    public function approve(Request $request, AssessmentControlResult $result): RedirectResponse
    {
        $data = $request->validate([
            'approval_status' => ['required', Rule::in(['approved', 'rejected'])],
        ]);

        $result->update([
            'approval_status' => $data['approval_status'],
            'approved_by'     => $request->user()->id,
            'approved_at'     => Carbon::now(),
        ]);

        $label = $data['approval_status'] === 'approved' ? 'disetujui' : 'ditolak';

        return redirect()->route('review.show', array_filter([
            'control'   => $result->control_id,
            'period'    => $result->assessment_period_id,
            'domain_id' => $request->query('domain_id'),
        ]))->with('success', "Kontrol berhasil {$label}.");
    }
}
