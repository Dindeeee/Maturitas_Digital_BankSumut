<?php

use App\Http\Controllers\Admin\DivisionController;
use App\Http\Controllers\Admin\MasterDataController;
use App\Http\Controllers\Admin\PeriodController;
use App\Http\Controllers\Admin\ReportController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\AssessmentController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ReviewController;
use Illuminate\Support\Facades\Route;

Route::get('/', fn () => view('welcome'))->name('home');

Route::middleware('auth')->group(function () {
    // Dashboard — semua role yang sudah login.
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

    // Profil (Breeze).
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // ── Admin ───────────────────────────────────────────────────────
    Route::middleware('role:admin')->prefix('admin')->name('admin.')->group(function () {
        Route::get('periods', [PeriodController::class, 'index'])->name('periods.index');
        Route::post('periods', [PeriodController::class, 'store'])->name('periods.store');
        Route::patch('periods/{period}/activate', [PeriodController::class, 'activate'])->name('periods.activate');
        Route::patch('periods/{period}/complete', [PeriodController::class, 'complete'])->name('periods.complete');

        Route::get('master-data', [MasterDataController::class, 'index'])->name('master-data.index');
        Route::put('master-data/{control}/pic', [MasterDataController::class, 'updatePic'])->name('master-data.pic');

        Route::resource('users', UserController::class)->only(['index', 'store', 'update', 'destroy']);
        Route::resource('divisions', DivisionController::class)->only(['index', 'store', 'update', 'destroy']);

    });

    // ── Laporan (admin, reviewer, viewer) ──────────────────────────
    Route::middleware('role:admin,reviewer,viewer')->prefix('reports')->name('reports.')->group(function () {
        Route::get('/', [ReportController::class, 'index'])->name('index');
        Route::get('export', [ReportController::class, 'export'])->name('export');
    });

    // ── Assessor ────────────────────────────────────────────────────
    Route::middleware('role:assessor')->prefix('assessment')->name('assessment.')->group(function () {
        Route::get('/', [AssessmentController::class, 'index'])->name('index');
        Route::get('{control}', [AssessmentController::class, 'show'])->name('show');
        Route::post('{control}', [AssessmentController::class, 'store'])->name('store');
    });

    // ── Review (reviewer = penuh, admin/viewer = baca-saja) ──────
    Route::prefix('review')->name('review.')->group(function () {
        // Lihat daftar & detail review — admin, reviewer & viewer (pimpinan).
        Route::middleware('role:admin,reviewer,viewer')->group(function () {
            Route::get('/', [ReviewController::class, 'index'])->name('index');
            Route::get('{control}', [ReviewController::class, 'show'])->name('show');
        });
        // Ubah status review — hanya reviewer.
        Route::middleware('role:reviewer')->group(function () {
            Route::patch('{result}', [ReviewController::class, 'update'])->name('update');
        });
    });

    /*
    | Route berikut ditambahkan di Fase E: admin.reports.export
    */
});

require __DIR__.'/auth.php';
