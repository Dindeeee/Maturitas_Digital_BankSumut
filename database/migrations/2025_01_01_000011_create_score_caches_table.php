<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Cache hasil perhitungan skor per level (control/subdomain/domain) tiap periode.
     * Diisi oleh ScoringService agar dashboard cepat tanpa hitung ulang.
     */
    public function up(): void
    {
        Schema::create('score_caches', function (Blueprint $table) {
            $table->id();
            $table->foreignId('assessment_period_id')->constrained()->cascadeOnDelete();
            $table->enum('scoreable_type', ['control', 'subdomain', 'domain']);
            $table->unsignedBigInteger('scoreable_id');
            $table->decimal('percentage', 5, 2);
            $table->string('category', 50);
            $table->unsignedTinyInteger('nilai'); // 1-5
            $table->timestamp('calculated_at');

            $table->unique(
                ['assessment_period_id', 'scoreable_type', 'scoreable_id'],
                'score_cache_unique'
            );
            $table->index(['assessment_period_id', 'scoreable_type'], 'score_cache_lookup');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('score_caches');
    }
};
