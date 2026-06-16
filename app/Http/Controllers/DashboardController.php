<?php

namespace App\Http\Controllers;

use App\Models\AssessmentPeriod;
use App\Models\Control;
use App\Models\Domain;
use App\Models\ScoreCache;
use App\Services\ScoringService;
use Illuminate\Http\Request;
use Illuminate\View\View;

class DashboardController extends Controller
{
    public function index(Request $request, ScoringService $scoring): View
    {
        $user = $request->user();
        $active = AssessmentPeriod::where('status', 'active')->orderByDesc('year')->first();

        // Assessor selalu memakai periode aktif (konteks pengisian).
        if ($user->isAssessor()) {
            return view('dashboard', $this->assessorData($user, $active));
        }

        // Admin/reviewer/viewer dapat memilih periode mana pun untuk ditinjau.
        $periods = AssessmentPeriod::orderByDesc('year')->orderByDesc('id')->get();
        $selected = null;
        if ($pid = $request->integer('period')) {
            $selected = $periods->firstWhere('id', $pid);
        }
        $selected ??= $active ?? $periods->first();

        return view('dashboard', $this->overviewData($selected, $scoring) + [
            'periods'          => $periods,
            'selectedPeriodId' => $selected?->id,
        ]);
    }

    /**
     * Data overview untuk admin / reviewer / viewer.
     */
    private function overviewData(?AssessmentPeriod $period, ScoringService $scoring): array
    {
        $domains = Domain::orderBy('order')->get();

        $base = [
            'role'        => 'overview',
            'period'      => $period,
            'totalDomain' => $domains->count(),
            'totalKontrol'=> Control::count(),
            'totalSub'    => \App\Models\SubControl::count(),
        ];

        if (! $period) {
            return $base + [
                'progressPct' => 0, 'radar' => null, 'domainRows' => collect(),
                'overallSkor' => null, 'overallNilai' => null, 'overallCategory' => null, 'prevPeriod' => null,
                'barColors' => [], 'categoryDist' => null, 'domainCharts' => [],
            ];
        }

        // Warna semantik per nilai (1 terbaik → 5 terburuk), terpisah dari warna brand.
        $catColor = [1 => '#16a34a', 2 => '#4ade80', 3 => '#fbbf24', 4 => '#f97316', 5 => '#ef4444'];

        // Palet warna KHAS per domain (urut Domain.order) — dipakai bar overview & chart per-domain.
        $domainPalette = ['#2563eb', '#f58220', '#16a34a', '#db2777', '#7c3aed', '#0891b2', '#ca8a04', '#dc2626'];

        $caches = ScoreCache::where('assessment_period_id', $period->id)
            ->where('scoreable_type', 'domain')->get()->keyBy('scoreable_id');

        // Periode tahun sebelumnya (untuk perbandingan), bila ada.
        $prevPeriod = AssessmentPeriod::where('year', '<', $period->year)
            ->orderByDesc('year')->first();
        $prevCaches = $prevPeriod
            ? ScoreCache::where('assessment_period_id', $prevPeriod->id)
                ->where('scoreable_type', 'domain')->get()->keyBy('scoreable_id')
            : collect();

        $domainRows = $domains->map(fn ($d) => [
            'code'     => $d->code,
            'name'     => $d->name,
            'cache'    => $caches[$d->id] ?? null,
            'prevSkor' => optional($prevCaches[$d->id] ?? null)->skor,
        ]);

        // Skor total = rata-rata skor domain (desimal), seperti Dashboard Excel.
        $overallSkor  = $scoring->overallScore($period);
        $overallNilai = $overallSkor !== null ? (int) ceil($overallSkor) : null;

        // Cache skor per kontrol → progres & distribusi kategori (untuk pie chart).
        $controlCaches = ScoreCache::where('assessment_period_id', $period->id)
            ->where('scoreable_type', 'control')->get();

        $progressPct = $base['totalKontrol']
            ? round($controlCaches->count() / $base['totalKontrol'] * 100)
            : 0;

        $dist = [1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0];
        foreach ($controlCaches as $cc) {
            if (isset($dist[$cc->nilai])) {
                $dist[$cc->nilai]++;
            }
        }
        $notScored = max(0, $base['totalKontrol'] - $controlCaches->count());

        $categoryDist = [
            'labels' => array_merge(array_map(fn ($n) => ScoringService::CATEGORY[$n], [1, 2, 3, 4, 5]), ['Belum Dinilai']),
            'data'   => array_merge(array_values($dist), [$notScored]),
            'colors' => array_merge(array_map(fn ($n) => $catColor[$n], [1, 2, 3, 4, 5]), ['#d1d5db']),
        ];

        // Bar overview "Skor per Domain": tiap domain memakai warna khasnya sendiri.
        $barColors = $domains->values()->map(fn ($d, $i) => $domainPalette[$i % count($domainPalette)])->all();

        // Data bar chart PER-DOMAIN: nilai (1–5) tiap kontrol, terurut subdomain→kontrol (mis. 1.A.1 … 1.B.16).
        $ctrlCacheById = $controlCaches->keyBy('scoreable_id');
        $allControls = Control::with('subdomain:id,domain_id,order')->get();
        $domainCharts = $domains->values()->map(function ($d, $i) use ($allControls, $ctrlCacheById, $domainPalette) {
            $rows = $allControls->filter(fn ($c) => $c->subdomain->domain_id === $d->id)
                ->sortBy(fn ($c) => sprintf('%03d.%03d', $c->subdomain->order, $c->order))
                ->values();

            return [
                'code'   => $d->code,
                'name'   => $d->name,
                'color'  => $domainPalette[$i % count($domainPalette)],
                'labels' => $rows->map(fn ($c) => $c->code)->all(),
                'data'   => $rows->map(fn ($c) => (int) (optional($ctrlCacheById[$c->id] ?? null)->nilai ?? 0))->all(),
            ];
        })->all();

        return $base + [
            'progressPct'     => $progressPct,
            'radar'           => [
                'labels' => $domains->pluck('code')->all(),
                'names'  => $domains->pluck('name')->all(),
                'data'   => $domains->map(fn ($d) => (float) (optional($caches[$d->id] ?? null)->skor ?? 0))->all(),
            ],
            'barColors'       => $barColors,
            'categoryDist'    => $categoryDist,
            'domainCharts'    => $domainCharts,
            'domainRows'      => $domainRows,
            'overallSkor'     => $overallSkor,
            'overallNilai'    => $overallNilai,
            'overallCategory' => $overallNilai ? ScoringService::CATEGORY[$overallNilai] : null,
            'prevPeriod'      => $prevPeriod,
        ];
    }

    /**
     * Data ringkasan progres untuk assessor.
     */
    private function assessorData($user, ?AssessmentPeriod $period): array
    {
        $base = ['role' => 'assessor', 'period' => $period, 'division' => $user->division];

        if (! $period || ! $user->division_id) {
            return $base + ['assigned' => 0, 'filled' => 0, 'progressPct' => 0];
        }

        $controlIds = Control::whereHas('divisions', fn ($q) => $q->where('divisions.id', $user->division_id))
            ->pluck('id');

        $assigned = $controlIds->count();
        $filled = ScoreCache::where('assessment_period_id', $period->id)
            ->where('scoreable_type', 'control')
            ->whereIn('scoreable_id', $controlIds)
            ->count();

        return $base + [
            'assigned'    => $assigned,
            'filled'      => $filled,
            'progressPct' => $assigned ? round($filled / $assigned * 100) : 0,
        ];
    }
}
