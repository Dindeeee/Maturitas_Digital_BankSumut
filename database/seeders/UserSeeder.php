<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * User awal: 1 admin + contoh tiap role untuk pengujian.
     * Password default semua: "password".
     */
    public function run(): void
    {
        $now = Carbon::now();

        // Assessor dipasang ke divisi DTI bila ada.
        $dtiId = DB::table('divisions')->where('code', 'DTI')->value('id');

        $users = [
            ['name' => 'Administrator',  'email' => 'admin@banksumut.co.id',    'role' => 'admin',    'division_id' => null],
            ['name' => 'Assessor DTI',   'email' => 'assessor@banksumut.co.id', 'role' => 'assessor', 'division_id' => $dtiId],
            ['name' => 'Reviewer',       'email' => 'reviewer@banksumut.co.id', 'role' => 'reviewer', 'division_id' => null],
            ['name' => 'Pimpinan',       'email' => 'viewer@banksumut.co.id',   'role' => 'viewer',   'division_id' => null],
        ];

        foreach ($users as $u) {
            DB::table('users')->updateOrInsert(
                ['email' => $u['email']],
                [
                    'name'        => $u['name'],
                    'role'        => $u['role'],
                    'division_id' => $u['division_id'],
                    'password'    => Hash::make('password'),
                    'created_at'  => $now,
                    'updated_at'  => $now,
                ]
            );
        }

        $this->command->info('User seed: admin, assessor, reviewer, viewer (password: "password").');
    }
}
