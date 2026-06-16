<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Tambah kolom `skor` (desimal 0-5) ke score_caches.
     * - Kontrol: skor = nilai (1-5).
     * - Subdomain/Domain: skor = rata-rata DESIMAL nilai kontrol (mengikuti Dashboard Excel).
     * Kolom `nilai` (integer) tetap dipertahankan untuk pemetaan kategori.
     */
    public function up(): void
    {
        Schema::table('score_caches', function (Blueprint $table) {
            $table->decimal('skor', 4, 2)->nullable()->after('percentage');
            // Persentase boleh kosong untuk skor hasil overlay Excel (mis. domain 4 / kontrol tanpa sub).
            $table->decimal('percentage', 5, 2)->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::table('score_caches', function (Blueprint $table) {
            $table->dropColumn('skor');
        });
    }
};
