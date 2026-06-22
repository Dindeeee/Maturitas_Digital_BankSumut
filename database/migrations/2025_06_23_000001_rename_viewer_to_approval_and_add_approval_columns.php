<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        DB::statement("ALTER TABLE users MODIFY COLUMN role ENUM('admin','assessor','reviewer','viewer','approval') NOT NULL DEFAULT 'assessor'");
        DB::table('users')->where('role', 'viewer')->update(['role' => 'approval']);
        DB::statement("ALTER TABLE users MODIFY COLUMN role ENUM('admin','assessor','reviewer','approval') NOT NULL DEFAULT 'assessor'");

        Schema::table('assessment_control_results', function (Blueprint $table) {
            $table->enum('approval_status', ['approved', 'rejected'])->nullable()->after('reviewed_at');
            $table->foreignId('approved_by')->nullable()->after('approval_status')->constrained('users')->nullOnDelete();
            $table->timestamp('approved_at')->nullable()->after('approved_by');
        });
    }

    public function down(): void
    {
        Schema::table('assessment_control_results', function (Blueprint $table) {
            $table->dropForeign(['approved_by']);
            $table->dropColumn(['approval_status', 'approved_by', 'approved_at']);
        });

        DB::table('users')->where('role', 'approval')->update(['role' => 'viewer']);
        DB::statement("ALTER TABLE users MODIFY COLUMN role ENUM('admin','assessor','reviewer','viewer') NOT NULL DEFAULT 'assessor'");
    }
};
