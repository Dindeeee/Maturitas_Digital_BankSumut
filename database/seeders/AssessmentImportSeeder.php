<?php

namespace Database\Seeders;

use App\Models\AssessmentControlResult;
use App\Models\AssessmentPeriod;
use App\Models\Control;
use App\Models\Domain;
use App\Models\ScoreCache;
use App\Models\User;
use App\Services\ScoringService;
use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class AssessmentImportSeeder extends Seeder
{
    /**
     * Impor hasil assessment 2025 dari database/data/assessment_2025.json
     * (di-parse dari Excel oleh parse_assessment_data.py).
     *
     * Idempoten: periode dgn nama sama dihapus & dibuat ulang (cascade).
     */
    public function run(): void
    {
        $path = database_path('data/assessment_2025.json');

        if (Control::count() === 0) {
            $this->command->error('Master data kosong. Jalankan dulu: php artisan db:seed --class=MasterDataSeeder');
            return;
        }
        if (! file_exists($path)) {
            $this->command->error("File tidak ditemukan: {$path}");
            $this->command->warn('Jalankan: python parse_assessment_data.py');
            return;
        }

        $data = json_decode(file_get_contents($path), true);
        $now = Carbon::now();
        $scoring = app(ScoringService::class);

        $admin    = User::where('role', 'admin')->first();
        $reviewer = User::where('role', 'reviewer')->first();
        $assessor = User::where('role', 'assessor')->first();
        $importerId = $assessor?->id ?? $admin?->id;

        // Peta kontrol & sub-kontrol untuk pencocokan cepat.
        $controls = Control::with('subControls')->get()->keyBy('code');
        $subMap = [];
        foreach ($controls as $code => $c) {
            foreach ($c->subControls as $sc) {
                $subMap[$code][$sc->order] = $sc->id;
            }
        }

        $period = DB::transaction(function () use ($data, $controls, $subMap, $now, $scoring, $admin, $reviewer, $importerId) {
            // Idempoten: hapus periode impor lama (cascade ke results & score_caches).
            AssessmentPeriod::where('name', $data['period']['name'])->get()->each->delete();

            $period = AssessmentPeriod::create([
                'year'       => $data['period']['year'],
                'name'       => $data['period']['name'],
                'status'     => $data['period']['status'],
                'start_date' => $data['period']['start_date'],
                'end_date'   => $data['period']['end_date'],
                'created_by' => $admin?->id,
            ]);

            $countAcr = 0;
            $countSub = 0;

            foreach ($data['controls'] as $row) {
                $control = $controls[$row['code']] ?? null;
                if (! $control) {
                    continue;
                }

                $done = $row['review_progress'] === 'done';
                $acrId = DB::table('assessment_control_results')->insertGetId([
                    'assessment_period_id' => $period->id,
                    'control_id'           => $control->id,
                    'penjelasan_aktor'     => $row['penjelasan_aktor'],
                    'penjelasan_dokumen'   => $row['penjelasan_dokumen'],
                    'penjelasan_kontrol'   => $row['penjelasan_kontrol'],
                    'rekomendasi'          => $row['rekomendasi'],
                    'referensi_dokumen'    => $row['referensi_dokumen'],
                    'review_progress'      => $row['review_progress'],
                    'reviewed_by'          => $done ? $reviewer?->id : null,
                    'reviewed_at'          => $done ? $now : null,
                    'created_at'           => $now,
                    'updated_at'           => $now,
                ]);
                $countAcr++;

                $subRows = [];
                foreach ($row['subs'] as $sub) {
                    $subId = $subMap[$row['code']][$sub['order']] ?? null;
                    if (! $subId) {
                        continue;
                    }
                    $status = $sub['status'];
                    $subRows[] = [
                        'assessment_control_result_id' => $acrId,
                        'sub_control_id'               => $subId,
                        'status'                       => $status,
                        'skor'                         => $scoring->scoreFromStatus($status),
                        'filled_by'                    => $status !== null ? $importerId : null,
                        'filled_at'                    => $status !== null ? $now : null,
                        'created_at'                   => $now,
                        'updated_at'                   => $now,
                    ];
                }
                if ($subRows) {
                    DB::table('assessment_sub_control_results')->insert($subRows);
                    $countSub += count($subRows);
                }
            }

            // Hitung skor: per kontrol → cache, lalu agregat subdomain & domain.
            AssessmentControlResult::where('assessment_period_id', $period->id)
                ->get()
                ->each(fn ($acr) => $scoring->calculateControl($acr));
            $scoring->recalculateAggregates($period);

            // ── Overlay skor OTORITATIF dari sheet Dashboard Score Excel ──
            $dash = $data['dashboard'] ?? null;
            if ($dash) {
                $domainByCode = Domain::pluck('id', 'code');
                $pctByNilai   = [1 => 92.5, 2 => 72.5, 3 => 50.5, 4 => 30.5, 5 => 10.0];

                // (a) Lengkapi kontrol yang belum terskor (mis. 2.A.1, 2.A.4, 4.A, 7.A.5).
                $hasCache = ScoreCache::where('assessment_period_id', $period->id)
                    ->where('scoreable_type', 'control')->pluck('scoreable_id')->all();
                foreach ($dash['control_nilai'] as $code => $nilai) {
                    $cid = $controls[$code]->id ?? null;
                    if (! $cid || in_array($cid, $hasCache, true)) {
                        continue;
                    }
                    ScoreCache::create([
                        'assessment_period_id' => $period->id,
                        'scoreable_type' => 'control', 'scoreable_id' => $cid,
                        'percentage' => $pctByNilai[$nilai] ?? null, 'skor' => $nilai,
                        'nilai' => $nilai, 'category' => ScoringService::CATEGORY[$nilai],
                        'calculated_at' => $now,
                    ]);
                }

                // (b) Timpa skor DOMAIN dgn nilai desimal Excel (termasuk domain 4 = 1.96).
                foreach ($dash['domain_scores'] as $dnum => $skor) {
                    $did = $domainByCode[$dnum] ?? null;
                    if (! $did) {
                        continue;
                    }
                    $nilai = (int) ceil($skor);
                    ScoreCache::updateOrCreate(
                        ['assessment_period_id' => $period->id, 'scoreable_type' => 'domain', 'scoreable_id' => $did],
                        ['skor' => $skor, 'nilai' => $nilai, 'category' => ScoringService::CATEGORY[$nilai], 'calculated_at' => $now],
                    );
                }

                // (c) Periode 2024 (histori) — hanya skor domain, untuk pembanding di dashboard.
                AssessmentPeriod::where('name', 'Assessment Maturitas Digital 2024 (Impor Excel)')->get()->each->delete();
                $prev = AssessmentPeriod::create([
                    'year' => 2024, 'name' => 'Assessment Maturitas Digital 2024 (Impor Excel)',
                    'status' => 'completed', 'start_date' => '2024-01-01', 'end_date' => '2024-12-31',
                    'created_by' => $admin?->id,
                ]);
                foreach ($dash['domain_prev'] as $dnum => $skor) {
                    $did = $domainByCode[$dnum] ?? null;
                    if (! $did) {
                        continue;
                    }
                    $nilai = (int) ceil($skor);
                    ScoreCache::create([
                        'assessment_period_id' => $prev->id, 'scoreable_type' => 'domain', 'scoreable_id' => $did,
                        'percentage' => $pctByNilai[$nilai] ?? null, 'skor' => $skor,
                        'nilai' => $nilai, 'category' => ScoringService::CATEGORY[$nilai], 'calculated_at' => $now,
                    ]);
                }
            }

            $this->command->info("Impor selesai: periode '{$period->name}', {$countAcr} kontrol, {$countSub} sub-kontrol.");

            return $period;
        });

        $domainCaches = $period->scoreCaches()->where('scoreable_type', 'domain')->count();
        $this->command->info("Score cache domain: {$domainCaches}. Skor total (nilai): ".($scoring->overallScore($period) ?? '-'));
    }
}
