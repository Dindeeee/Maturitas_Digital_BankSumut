<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ config('app.name', 'Bank Sumut') }}</title>

    <!-- Favicon -->
    <link rel="icon" href="{{ asset('favicon.ico') }}" sizes="any">
    <link rel="icon" type="image/png" href="{{ asset('storage/images/icon_bank_sumut.png') }}">
    <link rel="apple-touch-icon" href="{{ asset('storage/images/icon_bank_sumut.png') }}">

    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600,700&display=swap" rel="stylesheet" />

    @if (file_exists(public_path('build/manifest.json')) || file_exists(public_path('hot')))
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    @endif
</head>
<body class="font-sans antialiased bg-white text-gray-800">

    {{-- ===== Navbar ===== --}}
    <header class="sticky top-0 z-30 border-b border-gray-100 bg-white/90 backdrop-blur">
        <div class="mx-auto flex h-16 max-w-6xl items-center justify-between px-4 sm:px-6">
            <a href="#beranda" class="flex items-center gap-3">
                <x-application-logo class="h-9 w-auto" />
                <span class="leading-tight">
                    <span class="block text-sm font-semibold text-gray-800">Bank Sumut</span>
                    <span class="block text-[11px] text-gray-500">Asesmen Maturitas Digital</span>
                </span>
            </a>

            <nav class="hidden items-center gap-7 text-sm font-medium text-gray-600 md:flex">
                <a href="#beranda" class="hover:text-primary-600">Beranda</a>
                <a href="#tentang" class="hover:text-primary-600">Tentang</a>
                <a href="#fitur" class="hover:text-primary-600">Fitur</a>
            </nav>

            @auth
                <a href="{{ route('dashboard') }}"
                   class="rounded-lg bg-primary-600 px-4 py-2 text-sm font-medium text-white hover:bg-primary-700">
                    Buka Dashboard
                </a>
            @else
                <a href="{{ route('login') }}"
                   class="rounded-lg bg-primary-600 px-4 py-2 text-sm font-medium text-white hover:bg-primary-700">
                    Masuk
                </a>
            @endauth
        </div>
    </header>

    {{-- ===== Hero ===== --}}
    <section id="beranda" class="relative overflow-hidden bg-gradient-to-br from-primary-700 via-primary-600 to-primary-800 text-white">
        <div class="absolute -right-24 -top-24 h-72 w-72 rounded-full bg-accent-500/20 blur-3xl"></div>
        <div class="absolute -bottom-24 -left-24 h-72 w-72 rounded-full bg-white/10 blur-3xl"></div>

        <div class="relative mx-auto max-w-6xl px-4 py-20 sm:px-6 lg:py-28">
            <span class="inline-flex items-center rounded-full bg-white/15 px-3 py-1 text-xs font-medium text-primary-50">
                SEOJK No. 24/SEOJK.03/2023
            </span>
            <h1 class="mt-5 max-w-3xl text-3xl font-bold leading-tight sm:text-4xl lg:text-5xl">
                Asesmen Maturitas Digital <span class="text-accent-300">Bank Sumut</span>
            </h1>
            <p class="mt-5 max-w-2xl text-base text-primary-50/90 sm:text-lg">
                Platform digitalisasi kertas kerja asesmen tingkat maturitas digital perbankan —
                menggantikan proses manual berbasis Excel dengan sistem yang terukur, kolaboratif,
                dan dapat diaudit.
            </p>
            <div class="mt-8 flex flex-wrap gap-3">
                @auth
                    <a href="{{ route('dashboard') }}"
                       class="rounded-lg bg-white px-6 py-3 text-sm font-semibold text-primary-700 shadow hover:bg-primary-50">
                        Buka Dashboard
                    </a>
                @else
                    <a href="{{ route('login') }}"
                       class="rounded-lg bg-white px-6 py-3 text-sm font-semibold text-primary-700 shadow hover:bg-primary-50">
                        Masuk ke Aplikasi
                    </a>
                @endauth
                <a href="#tentang"
                   class="rounded-lg border border-white/40 px-6 py-3 text-sm font-semibold text-white hover:bg-white/10">
                    Pelajari Selengkapnya
                </a>
            </div>
        </div>
    </section>

    {{-- ===== Statistik ===== --}}
    <section class="border-b border-gray-100 bg-gray-50">
        <div class="mx-auto grid max-w-6xl grid-cols-2 gap-6 px-4 py-10 sm:px-6 lg:grid-cols-4">
            @foreach ([['8','Domain'],['94','Kontrol'],['339','Sub-kontrol'],['4','Peran Pengguna']] as [$num, $label])
                <div class="text-center">
                    <div class="text-3xl font-bold text-primary-600">{{ $num }}</div>
                    <div class="mt-1 text-sm text-gray-500">{{ $label }}</div>
                </div>
            @endforeach
        </div>
    </section>

    {{-- ===== Tentang ===== --}}
    <section id="tentang" class="mx-auto max-w-6xl px-4 py-16 sm:px-6 lg:py-20">
        <div class="grid grid-cols-1 gap-10 lg:grid-cols-2 lg:items-center">
            <div>
                <h2 class="text-2xl font-bold text-gray-800 sm:text-3xl">Tentang Aplikasi</h2>
                <p class="mt-4 text-gray-600">
                    Aplikasi ini dikembangkan untuk PT Bank Sumut sebagai sarana penilaian mandiri
                    (<em>self-assessment</em>) tingkat maturitas digital sesuai pedoman Otoritas Jasa Keuangan.
                    Seluruh kertas kerja yang sebelumnya dikelola dalam berkas Excel kini terstruktur dalam
                    satu sistem dengan kontrol akses, penelusuran riwayat, dan perhitungan skor otomatis.
                </p>
                <p class="mt-4 text-gray-600">
                    Penilaian mencakup <strong>8 domain</strong>, <strong>94 kontrol</strong>, dan
                    <strong>339 sub-kontrol</strong>. Setiap sub-kontrol dinilai (Ada / Partial / Tidak)
                    lalu dikonversi menjadi persentase dan peringkat maturitas (Nilai 1–5) mengikuti
                    skala OJK.
                </p>
            </div>

            <div class="rounded-2xl border border-gray-200 bg-gradient-to-br from-primary-50 to-accent-50 p-8">
                <h3 class="font-semibold text-gray-800">Peringkat Maturitas (OJK)</h3>
                <ul class="mt-4 space-y-3 text-sm">
                    <li class="flex items-center justify-between"><span class="flex items-center gap-2"><span class="h-3 w-3 rounded-full bg-green-600"></span> Sangat Memadai (Strong)</span><span class="text-gray-500">Nilai 1 · ≥85%</span></li>
                    <li class="flex items-center justify-between"><span class="flex items-center gap-2"><span class="h-3 w-3 rounded-full bg-green-400"></span> Memadai (Satisfactory)</span><span class="text-gray-500">Nilai 2 · 61–84%</span></li>
                    <li class="flex items-center justify-between"><span class="flex items-center gap-2"><span class="h-3 w-3 rounded-full bg-amber-400"></span> Cukup Memadai (Fair)</span><span class="text-gray-500">Nilai 3 · 41–60%</span></li>
                    <li class="flex items-center justify-between"><span class="flex items-center gap-2"><span class="h-3 w-3 rounded-full bg-orange-500"></span> Kurang Memadai (Marginal)</span><span class="text-gray-500">Nilai 4 · 21–40%</span></li>
                    <li class="flex items-center justify-between"><span class="flex items-center gap-2"><span class="h-3 w-3 rounded-full bg-red-500"></span> Tidak Memadai (Unsatisfactory)</span><span class="text-gray-500">Nilai 5 · ≤20%</span></li>
                </ul>
            </div>
        </div>
    </section>

    {{-- ===== Fitur ===== --}}
    <section id="fitur" class="bg-gray-50 py-16 lg:py-20">
        <div class="mx-auto max-w-6xl px-4 sm:px-6">
            <div class="text-center">
                <h2 class="text-2xl font-bold text-gray-800 sm:text-3xl">Fitur Utama</h2>
                <p class="mx-auto mt-3 max-w-2xl text-gray-600">
                    Mendukung seluruh alur asesmen dari pengisian, penelaahan, hingga pelaporan.
                </p>
            </div>

            <div class="mt-12 grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
                @php
                    $features = [
                        ['Penilaian Terstruktur', '8 domain, 94 kontrol & 339 sub-kontrol sesuai kerangka SEOJK No. 24.', 'primary'],
                        ['Skoring Otomatis', 'Persentase dan peringkat maturitas dihitung otomatis tiap kontrol & domain.', 'accent'],
                        ['Kontrol Akses per Peran', 'Empat peran: Admin, Assessor, Reviewer, dan Viewer (Pimpinan).', 'primary'],
                        ['Dashboard & Visualisasi', 'Radar chart per domain serta perbandingan skor antar tahun.', 'accent'],
                        ['Alur Review', 'Reviewer menelaah isian assessor dan menetapkan status review.', 'primary'],
                        ['Export Laporan', 'Unduh laporan lengkap dalam format Excel maupun PDF.', 'accent'],
                    ];
                @endphp
                @foreach ($features as [$title, $desc, $tone])
                    <div class="rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
                        <div class="flex h-11 w-11 items-center justify-center rounded-lg {{ $tone === 'accent' ? 'bg-accent-50 text-accent-600' : 'bg-primary-50 text-primary-600' }}">
                            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        </div>
                        <h3 class="mt-4 font-semibold text-gray-800">{{ $title }}</h3>
                        <p class="mt-2 text-sm text-gray-600">{{ $desc }}</p>
                    </div>
                @endforeach
            </div>
        </div>
    </section>

    {{-- ===== CTA ===== --}}
    <section class="bg-primary-700">
        <div class="mx-auto flex max-w-6xl flex-col items-center gap-4 px-4 py-14 text-center sm:px-6">
            <h2 class="text-2xl font-bold text-white sm:text-3xl">Siap memulai asesmen?</h2>
            <p class="max-w-xl text-primary-50/90">Masuk menggunakan akun yang telah diberikan administrator untuk mengakses aplikasi.</p>
            <a href="{{ auth()->check() ? route('dashboard') : route('login') }}"
               class="mt-2 rounded-lg bg-white px-6 py-3 text-sm font-semibold text-primary-700 shadow hover:bg-primary-50">
                {{ auth()->check() ? 'Buka Dashboard' : 'Masuk ke Aplikasi' }}
            </a>
        </div>
    </section>

    {{-- ===== Footer ===== --}}
    <footer class="border-t border-gray-100 bg-white">
        <div class="mx-auto flex max-w-6xl flex-col items-center justify-between gap-3 px-4 py-6 text-sm text-gray-500 sm:flex-row sm:px-6">
            <div class="flex items-center gap-2">
                <x-application-logo class="h-7 w-auto" />
                <span>© {{ date('Y') }} PT Bank Sumut — Asesmen Maturitas Digital</span>
            </div>
            <span class="text-xs">SEOJK No. 24/SEOJK.03/2023</span>
        </div>
    </footer>

</body>
</html>
