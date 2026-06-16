<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * 339 Sub-kontrol (kriteria) di bawah tiap kontrol, 1-11 per kontrol.
     */
    public function up(): void
    {
        Schema::create('sub_controls', function (Blueprint $table) {
            $table->id();
            $table->foreignId('control_id')->constrained()->cascadeOnDelete();
            $table->string('label', 10);
            $table->text('criteria_description');
            $table->unsignedTinyInteger('order');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('sub_controls');
    }
};
