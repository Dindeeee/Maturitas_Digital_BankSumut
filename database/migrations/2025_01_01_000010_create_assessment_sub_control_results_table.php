<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Isian assessment per sub-kontrol: status (ada/partial/tidak) dan skor (2/1/0).
     */
    public function up(): void
    {
        Schema::create('assessment_sub_control_results', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('assessment_control_result_id');
            $table->foreign('assessment_control_result_id', 'ascr_acr_id_foreign')
                ->references('id')->on('assessment_control_results')->cascadeOnDelete();
            $table->foreignId('sub_control_id')->constrained();
            $table->enum('status', ['ada', 'partial', 'tidak'])->nullable();
            $table->unsignedTinyInteger('skor')->nullable(); // 2=ada, 1=partial, 0=tidak
            $table->foreignId('filled_by')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamp('filled_at')->nullable();
            $table->timestamps();

            $table->unique(['assessment_control_result_id', 'sub_control_id'], 'ascr_result_subcontrol_unique');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('assessment_sub_control_results');
    }
};
