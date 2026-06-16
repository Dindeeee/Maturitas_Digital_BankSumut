<?php

namespace App\Services;

use App\Models\AssessmentControlResult;
use App\Models\AssessmentPeriod;
use App\Models\Control;
use App\Models\ScoreCache;
use Illuminate\Support\Carbon;

/**
 * Perhitungan skor maturitas mengikuti skala OJK (SEOJK No. 24).
 *
 * PENTING: skala peringkat KEBALIK — nilai 1 = TERBAIK, nilai 5 = TERBURUK.
 *   85–100% → 1 Sangat Memadai
 *   61–84%  → 2 Memadai
 *   41–60%  → 3 Cukup Memadai
 *   21–40%  → 4 Kurang Memadai
 *    0–20%  → 5 Tidak Memadai
 *
 * Skor sub-kontrol: Ada=2, Partial=1, Tidak=0.
 * Persentase kontrol = sum(skor) / (jumlah_subkontrol_terisi * 2) * 100.
 * Nilai subdomain/domain = pembulatan rata-rata nilai kontrol di bawahnya.
 */
class ScoringService
{
    public const STATUS_SCORE = ['ada' => 2, 'partial' => 1, 'tidak' => 0];

    public const CATEGORY = [
        1 => 'Sangat Memadai (Strong)',
        2 => 'Memadai (Satisfactory)',
        3 => 'Cukup Memadai (Fair)',
        4 => 'Kurang Memadai (Marginal)',
        5 => 'Tidak Memadai (Unsatisfactory)',
    ];

    public function scoreFromStatus(?string $status): ?int
    {
        return $status === null ? null : (self::STATUS_SCORE[$status] ?? 0);
    }

    /**
     * Map persentase → ['nilai' => int(1-5), 'category' => string].
     */
    public function gradeFromPercentage(float $pct): array
    {
        $nilai = match (true) {
            $pct >= 85 => 1,
            $pct >= 61 => 2,
            $pct >= 41 => 3,
            $pct >= 21 => 4,
            default    => 5,
        };

        return ['nilai' => $nilai, 'category' => self::CATEGORY[$nilai]];
    }

    /**
     * Hitung skor satu kontrol dari sub-kontrol yang sudah terisi, lalu upsert cache.
     * Mengembalikan persentase, atau null bila belum ada sub-kontrol terisi.
     */
    public function calculateControl(AssessmentControlResult $acr): ?float
    {
        $filled = $acr->subResults()->whereNotNull('status')->get();

        if ($filled->isEmpty()) {
            // Hapus cache lama bila ada (kontrol kembali kosong).
            ScoreCache::where('assessment_period_id', $acr->assessment_period_id)
                ->where('scoreable_type', 'control')
                ->where('scoreable_id', $acr->control_id)
                ->delete();
            return null;
        }

        $sum   = $filled->sum(fn ($s) => self::STATUS_SCORE[$s->status] ?? 0);
        $pct   = round($sum / ($filled->count() * 2) * 100, 2);
        $grade = $this->gradeFromPercentage($pct);
        $grade['skor'] = $grade['nilai']; // skor kontrol = nilai (1-5)

        $this->upsertCache($acr->assessment_period_id, 'control', $acr->control_id, $pct, $grade);

        return $pct;
    }

    /**
     * Hitung ulang cache subdomain & domain dari cache kontrol periode tsb.
     */
    public function recalculateAggregates(AssessmentPeriod $period): void
    {
        $controlCaches = ScoreCache::where('assessment_period_id', $period->id)
            ->where('scoreable_type', 'control')
            ->get()
            ->keyBy('scoreable_id');

        if ($controlCaches->isEmpty()) {
            ScoreCache::where('assessment_period_id', $period->id)
                ->whereIn('scoreable_type', ['subdomain', 'domain'])
                ->delete();
            return;
        }

        $controls = Control::with('subdomain:id,domain_id')
            ->whereIn('id', $controlCaches->keys())
            ->get();

        $bySub = [];   // subdomain_id => [caches]
        $byDom = [];   // domain_id    => [caches]
        foreach ($controls as $c) {
            $cache = $controlCaches[$c->id];
            $bySub[$c->subdomain_id][] = $cache;
            $byDom[$c->subdomain->domain_id][] = $cache;
        }

        foreach ($bySub as $subId => $caches) {
            $this->upsertAggregate($period->id, 'subdomain', $subId, $caches);
        }
        foreach ($byDom as $domId => $caches) {
            $this->upsertAggregate($period->id, 'domain', $domId, $caches);
        }
    }

    /**
     * Skor total periode = rata-rata nilai 8 domain (1-5), atau null bila kosong.
     */
    public function overallScore(AssessmentPeriod $period): ?float
    {
        $domain = ScoreCache::where('assessment_period_id', $period->id)
            ->where('scoreable_type', 'domain')
            ->pluck('skor');

        return $domain->isEmpty() ? null : round($domain->avg(), 2);
    }

    /**
     * @param  \Illuminate\Support\Collection<int,ScoreCache>  $caches
     */
    private function upsertAggregate(int $periodId, string $type, int $scoreableId, array $caches): void
    {
        $collection = collect($caches);
        $skor  = round($collection->avg('nilai'), 4); // rata-rata DESIMAL nilai kontrol (cara Excel)
        $nilai = (int) ceil($skor);                   // peringkat dari pembulatan KE ATAS (mengikuti Excel)
        $pct   = round($collection->avg('percentage'), 2);

        $this->upsertCache($periodId, $type, $scoreableId, $pct, [
            'nilai'    => $nilai,
            'category' => self::CATEGORY[$nilai],
            'skor'     => $skor,
        ]);
    }

    private function upsertCache(int $periodId, string $type, int $scoreableId, float $pct, array $grade): void
    {
        ScoreCache::updateOrCreate(
            [
                'assessment_period_id' => $periodId,
                'scoreable_type'       => $type,
                'scoreable_id'         => $scoreableId,
            ],
            [
                'percentage'    => $pct,
                'skor'          => $grade['skor'] ?? $grade['nilai'],
                'category'      => $grade['category'],
                'nilai'         => $grade['nilai'],
                'calculated_at' => Carbon::now(),
            ],
        );
    }
}
