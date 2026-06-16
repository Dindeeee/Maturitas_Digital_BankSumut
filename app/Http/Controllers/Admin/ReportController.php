<?php

namespace App\Http\Controllers\Admin;

use App\Exports\AssessmentExport;
use App\Http\Controllers\Controller;
use App\Models\AssessmentControlResult;
use App\Models\AssessmentPeriod;
use App\Models\Control;
use App\Models\Domain;
use App\Models\ScoreCache;
use App\Services\ScoringService;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Symfony\Component\HttpFoundation\Response;

class ReportController extends Controller
{
    public function index(Request $request): View
    {
        $periods = AssessmentPeriod::whereIn('status', ['active', 'completed'])
            ->orderByDesc('year')->orderByDesc('id')->get();

        $period = null;
        if ($pid = $request->integer('period')) {
            $period = $periods->firstWhere('id', $pid);
        }
        $period ??= $periods->first();

        return view('admin.reports.index', compact('period', 'periods'));
    }

    public function export(Request $request): Response|RedirectResponse
    {
        $period = null;
        if ($pid = $request->integer('period')) {
            $period = AssessmentPeriod::whereIn('status', ['active', 'completed'])->find($pid);
        }
        $period ??= AssessmentPeriod::where('status', 'active')->orderByDesc('year')->first()
            ?? AssessmentPeriod::orderByDesc('year')->first();

        if (! $period) {
            return back()->with('error', 'Belum ada periode assessment untuk diekspor.');
        }

        $data   = $this->buildData($period);
        $format = $request->query('format', 'excel');
        $slug   = 'assessment-maturitas-'.$period->year;

        if ($format === 'pdf') {
            return Pdf::loadView('admin.reports.pdf', $data)
                ->setPaper('a4', 'landscape')
                ->download($slug.'.pdf');
        }

        $tmp = tempnam(sys_get_temp_dir(), 'assessment').'.xlsx';
        (new AssessmentExport($data))->write($tmp);

        return response()->download($tmp, $slug.'.xlsx', [
            'Content-Type' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        ])->deleteFileAfterSend();
    }

    private function buildData(AssessmentPeriod $period): array
    {
        $domains = Domain::orderBy('order')->get();

        $domainScores = ScoreCache::where('assessment_period_id', $period->id)
            ->where('scoreable_type', 'domain')->get()->keyBy('scoreable_id');

        $controlScores = ScoreCache::where('assessment_period_id', $period->id)
            ->where('scoreable_type', 'control')->get()->keyBy('scoreable_id');

        $acrs = AssessmentControlResult::where('assessment_period_id', $period->id)
            ->with('reviewer')
            ->get()->keyBy('control_id');

        $controls = Control::with('subdomain.domain')->get();

        // Detail per kontrol
        $rows = $controls->sortBy('code')->values()->map(fn ($c) => [
            'domain'     => $c->subdomain->domain->code.'. '.$c->subdomain->domain->name,
            'subdomain'  => $c->subdomain->name,
            'code'       => $c->code,
            'title'      => $c->title,
            'percentage' => optional($controlScores[$c->id] ?? null)->percentage,
            'nilai'      => optional($controlScores[$c->id] ?? null)->nilai,
            'category'   => optional($controlScores[$c->id] ?? null)->category,
        ]);

        $domainRows = $domains->map(fn ($d) => [
            'code'  => $d->code,
            'name'  => $d->name,
            'cache' => $domainScores[$d->id] ?? null,
        ]);

        // Overall score
        $overallSkor     = $domainScores->count() ? round($domainScores->pluck('skor')->avg(), 2) : null;
        $overallNilai    = $overallSkor !== null ? (int) ceil($overallSkor) : null;
        $overallCategory = $overallNilai ? ScoringService::CATEGORY[$overallNilai] : null;

        // Review per kontrol (Excel sheet terpisah)
        $reviewLabels = ['pending' => 'Pending', 'in_progress' => 'Sedang Diproses', 'done' => 'Selesai'];
        $reviewRows = $controls->sortBy('code')->values()->map(function ($c) use ($acrs, $reviewLabels) {
            $acr = $acrs[$c->id] ?? null;

            return [
                'code'        => $c->code,
                'title'       => $c->title,
                'domain'      => $c->subdomain->domain->code.'. '.$c->subdomain->domain->name,
                'status'      => $reviewLabels[$acr?->review_progress ?? 'pending'] ?? 'Pending',
                'reviewer'    => $acr?->reviewer?->name ?? '—',
                'reviewed_at' => $acr?->reviewed_at?->format('d M Y H:i') ?? '—',
            ];
        });

        // Distribusi kategori kontrol
        $categoryDist = [];
        foreach ([1, 2, 3, 4, 5] as $n) {
            $categoryDist[$n] = [
                'label' => ScoringService::CATEGORY[$n],
                'count' => $controlScores->where('nilai', $n)->count(),
            ];
        }
        $notScored = $controls->count() - $controlScores->count();

        // Chart per domain — nilai tiap kontrol (sama dgn dashboard)
        $domainPalette = ['2563eb', 'f58220', '16a34a', 'db2777', '7c3aed', '0891b2', 'ca8a04', 'dc2626'];
        $domainCharts = $domains->values()->map(function ($d, $i) use ($controls, $controlScores, $domainPalette) {
            $ctrls = $controls
                ->filter(fn ($c) => $c->subdomain->domain_id === $d->id)
                ->sortBy(fn ($c) => sprintf('%03d.%03d', $c->subdomain->order, $c->order))
                ->values();

            return [
                'code'   => $d->code,
                'name'   => $d->name,
                'color'  => $domainPalette[$i % count($domainPalette)],
                'labels' => $ctrls->map(fn ($c) => $c->code)->all(),
                'data'   => $ctrls->map(fn ($c) => (int) (optional($controlScores[$c->id] ?? null)->nilai ?? 0))->all(),
            ];
        })->all();

        return compact(
            'period', 'rows', 'domainRows',
            'overallSkor', 'overallNilai', 'overallCategory',
            'reviewRows', 'categoryDist', 'notScored', 'domainCharts',
        );
    }
}
