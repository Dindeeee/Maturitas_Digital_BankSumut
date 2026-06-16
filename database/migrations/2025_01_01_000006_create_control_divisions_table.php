<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Pivot penugasan: divisi mana yang menjadi PIC untuk tiap kontrol.
     */
    public function up(): void
    {
        Schema::create('control_divisions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('control_id')->constrained()->cascadeOnDelete();
            $table->foreignId('division_id')->constrained()->cascadeOnDelete();
            $table->unique(['control_id', 'division_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('control_divisions');
    }
};
