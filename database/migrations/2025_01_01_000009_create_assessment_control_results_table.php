<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Hasil assessment per kontrol dalam satu periode: penjelasan, rekomendasi,
     * dan status review oleh reviewer.
     */
    public function up(): void
    {
        Schema::create('assessment_control_results', function (Blueprint $table) {
            $table->id();
            $table->foreignId('assessment_period_id')->constrained()->cascadeOnDelete();
            $table->foreignId('control_id')->constrained();
            $table->text('penjelasan_aktor')->nullable();
            $table->text('penjelasan_dokumen')->nullable();
            $table->text('penjelasan_kontrol')->nullable();
            $table->text('rekomendasi')->nullable();
            $table->text('referensi_dokumen')->nullable();
            $table->enum('review_progress', ['pending', 'in_progress', 'done'])->default('pending');
            $table->foreignId('reviewed_by')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamp('reviewed_at')->nullable();
            $table->timestamps();

            $table->unique(['assessment_period_id', 'control_id'], 'acr_period_control_unique');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('assessment_control_results');
    }
};
