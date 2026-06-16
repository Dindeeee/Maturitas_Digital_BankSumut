<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class MasterDataSeeder extends Seeder
{
    /**
     * Seed master data assessment (divisi, domain, subdomain, kontrol, sub-kontrol,
     * dan penugasan PIC) dari database/data/master_data.json.
     *
     * Sumber: "Kertas Kerja Assessment Maturitas Digital Bank Umum_2025.xlsx"
     * di-parse oleh parse_master_data.py.
     */
    public function run(): void
    {
        $path = database_path('data/master_data.json');

        if (! file_exists($path)) {
            $this->command->error("File master data tidak ditemukan: {$path}");
            $this->command->warn('Jalankan: python parse_master_data.py');
            return;
        }

        $data = json_decode(file_get_contents($path), true);
        $now  = Carbon::now();

        DB::transaction(function () use ($data, $now) {
            // ── Divisions ────────────────────────────────────────────
            $divisionId = []; // code => id
            foreach ($data['divisions'] as $d) {
                $divisionId[$d['code']] = DB::table('divisions')->insertGetId([
                    'code'       => $d['code'],
                    'name'       => $d['name'],
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);
            }

            // ── Domains ──────────────────────────────────────────────
            $domainId = []; // code => id
            foreach ($data['domains'] as $d) {
                $domainId[$d['code']] = DB::table('domains')->insertGetId([
                    'code'       => $d['code'],
                    'name'       => $d['name'],
                    'order'      => $d['order'],
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);
            }

            // ── Subdomains ───────────────────────────────────────────
            $subdomainId = []; // code => id
            foreach ($data['subdomains'] as $s) {
                $subdomainId[$s['code']] = DB::table('subdomains')->insertGetId([
                    'domain_id'  => $domainId[$s['domain_code']],
                    'code'       => $s['code'],
                    'name'       => $s['name'],
                    'order'      => $s['order'],
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);
            }

            // ── Controls (+ kumpulkan penugasan PIC) ─────────────────
            $controlId = []; // code => id
            $pivotRows = [];
            foreach ($data['controls'] as $c) {
                $id = DB::table('controls')->insertGetId([
                    'subdomain_id' => $subdomainId[$c['subdomain_code']],
                    'code'         => $c['code'],
                    'title'        => $c['title'],
                    'description'  => null,
                    'order'        => $c['order'],
                    'created_at'   => $now,
                    'updated_at'   => $now,
                ]);
                $controlId[$c['code']] = $id;

                foreach ($c['pics'] as $picCode) {
                    if (isset($divisionId[$picCode])) {
                        $pivotRows[] = [
                            'control_id'  => $id,
                            'division_id' => $divisionId[$picCode],
                        ];
                    }
                }
            }

            // ── Control-Division (pivot PIC) ─────────────────────────
            if ($pivotRows) {
                DB::table('control_divisions')->insert($pivotRows);
            }

            // ── Sub-controls (chunk agar ringan) ─────────────────────
            $subRows = [];
            foreach ($data['sub_controls'] as $s) {
                if (! isset($controlId[$s['control_code']])) {
                    continue; // lewati jika kode kontrol tidak dikenal
                }
                $subRows[] = [
                    'control_id'           => $controlId[$s['control_code']],
                    'label'                => $s['label'],
                    'criteria_description' => $s['criteria_description'],
                    'order'                => $s['order'],
                    'created_at'           => $now,
                    'updated_at'           => $now,
                ];
            }
            foreach (array_chunk($subRows, 100) as $chunk) {
                DB::table('sub_controls')->insert($chunk);
            }

            $this->command->info(sprintf(
                'Master data: %d divisi, %d domain, %d subdomain, %d kontrol, %d sub-kontrol, %d penugasan PIC.',
                count($data['divisions']),
                count($data['domains']),
                count($data['subdomains']),
                count($data['controls']),
                count($subRows),
                count($pivotRows),
            ));
        });
    }
}
