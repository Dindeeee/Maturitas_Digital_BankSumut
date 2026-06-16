<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Tambah kolom role & division_id ke tabel users bawaan Breeze.
     * Dijalankan setelah tabel divisions ada agar FK valid.
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->enum('role', ['admin', 'assessor', 'reviewer', 'viewer'])
                ->default('assessor')
                ->after('email');
            $table->foreignId('division_id')
                ->nullable()
                ->after('role')
                ->constrained()
                ->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign(['division_id']);
            $table->dropColumn(['role', 'division_id']);
        });
    }
};
