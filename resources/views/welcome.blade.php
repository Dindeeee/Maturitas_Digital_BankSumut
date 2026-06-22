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

    <style>
        html {
            scroll-behavior: smooth;
            scroll-padding-top: 4.5rem;
        }

        .nav-link {
            position: relative;
            transition: color 0.2s;
        }
        .nav-link::after {
            content: '';
            position: absolute;
            left: 0; right: 0; bottom: -4px;
            height: 2px;
            background: #F58220;
            border-radius: 1px;
            transform: scaleX(0);
            transition: transform 0.25s ease;
        }
        .nav-link.active {
            color: #F58220;
        }
        .nav-link.active::after,
        .nav-link:hover::after {
            transform: scaleX(1);
        }

        .scroll-reveal {
            opacity: 0;
            transform: translateY(28px);
            transition: opacity 0.55s ease, transform 0.55s ease;
        }
        .scroll-reveal.visible {
            opacity: 1;
            transform: translateY(0);
        }
    </style>
</head>
<body class="font-sans antialiased bg-white text-gray-800">

    {{-- ===== Navbar ===== --}}
    <header class="sticky top-0 z-30 border-b border-gray-100 bg-white/90 backdrop-blur">
        <div class="mx-auto flex h-16 max-w-6xl items-center justify-between px-4 sm:px-6">
            <a href="#beranda" class="flex items-center gap-3">
                <x-application-logo class="h-9 w-auto" />
                <span class="leading-tight">
                    <span class="block text-sm font-semibold text-gray-800">Bank Sumut</span>
                    <span class="block text-[11px] text-gray-500">Assessment Maturitas Digital</span>
                </span>
            </a>

            <nav class="hidden items-center gap-7 text-sm font-medium text-gray-600 md:flex">
                <a href="#beranda" class="nav-link hover:text-primary-600" data-section="beranda">Beranda</a>
                <a href="#landasan-hukum" class="nav-link hover:text-primary-600" data-section="landasan-hukum">Landasan Hukum</a>
                <a href="#matriks" class="nav-link hover:text-primary-600" data-section="matriks">Matriks Maturitas</a>
                <a href="#fitur" class="nav-link hover:text-primary-600" data-section="fitur">Fitur</a>
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
                Assessment Maturitas Digital <span class="text-accent-300">Bank Sumut</span>
            </h1>
            <p class="mt-5 max-w-2xl text-base text-primary-50/90 sm:text-lg">
                Platform digitalisasi kertas kerja assessment tingkat maturitas digital perbankan —
                menggantikan proses manual berbasis Excel dengan sistem yang terukur, kolaboratif,
                dan dapat diaudit.
            </p>
        </div>
    </section>

    {{-- ===== Statistik ===== --}}
    <section class="border-b border-gray-100 bg-gray-50 scroll-reveal">
        <div class="mx-auto grid max-w-6xl grid-cols-2 gap-6 px-4 py-10 sm:px-6 lg:grid-cols-4">
            @foreach ([['8','Domain'],['94','Kontrol'],['339','Sub-kontrol'],['4','Peran Pengguna']] as [$num, $label])
                <div class="text-center">
                    <div class="text-3xl font-bold text-primary-600">{{ $num }}</div>
                    <div class="mt-1 text-sm text-gray-500">{{ $label }}</div>
                </div>
            @endforeach
        </div>
    </section>

    {{-- ===== Landasan Hukum ===== --}}
    <section id="landasan-hukum" class="mx-auto max-w-6xl px-4 py-16 sm:px-6 lg:py-20 scroll-reveal">
        <div class="text-center">
            <h2 class="text-2xl font-bold text-gray-800 sm:text-3xl">Landasan Hukum</h2>
            <p class="mx-auto mt-3 max-w-2xl text-gray-500">
                Acuan regulasi yang menjadi dasar pelaksanaan penilaian tingkat maturitas digital.
            </p>
        </div>

        <div class="mt-12 grid grid-cols-1 gap-6 lg:grid-cols-2">
            {{-- Kartu POJK --}}
            <div class="rounded-2xl border border-accent-100 bg-gradient-to-br from-accent-50 to-white p-6 sm:p-8">
                <div class="flex items-center gap-3">
                    <span class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-accent-600 text-white">
                        <svg class="h-5 w-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6.042A8.967 8.967 0 006 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 016 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 016-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0018 18a8.967 8.967 0 00-6 2.292m0-14.25v14.25"/></svg>
                    </span>
                    <div>
                        <h3 class="font-bold text-gray-800">POJK No. 11/POJK.03/2022</h3>
                        <p class="text-xs text-gray-500">Peraturan Otoritas Jasa Keuangan</p>
                    </div>
                </div>
                <p class="mt-4 text-sm leading-relaxed text-gray-600">
                    Tentang <strong>Penyelenggaraan Teknologi Informasi oleh Bank Umum</strong>.
                    Pasal 66 mengamanatkan Bank untuk melakukan penilaian sendiri atas tingkat maturitas digital
                    secara berkala, paling sedikit 1 (satu) kali dalam 1 (satu) tahun.
                </p>
            </div>

            {{-- Kartu SEOJK --}}
            <div class="rounded-2xl border border-primary-100 bg-gradient-to-br from-primary-50 to-white p-6 sm:p-8">
                <div class="flex items-center gap-3">
                    <span class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-primary-600 text-white">
                        <svg class="h-5 w-5" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z"/></svg>
                    </span>
                    <div>
                        <h3 class="font-bold text-gray-800">SEOJK No. 24/SEOJK.03/2023</h3>
                        <p class="text-xs text-gray-500">Surat Edaran OJK — 14 Desember 2023</p>
                    </div>
                </div>
                <p class="mt-4 text-sm leading-relaxed text-gray-600">
                    Tentang <strong>Penilaian Tingkat Maturitas Digital Bank Umum</strong>.
                    Menjadi panduan untuk menentukan, menilai, dan mengevaluasi tingkat digitalisasi Bank,
                    serta alat monitoring terhadap perkembangan transformasi digital.
                </p>
            </div>
        </div>

        {{-- 8 Domain Penilaian --}}
        <div class="mt-10 rounded-2xl border border-gray-200 bg-white p-6 sm:p-8">
            <h3 class="text-center font-bold text-gray-800">8 Domain Penilaian Maturitas Digital</h3>
            <p class="mt-1 text-center text-sm text-gray-500">Sesuai Lampiran I SEOJK No. 24/SEOJK.03/2023</p>
            <div class="mt-6 grid grid-cols-2 gap-3 sm:grid-cols-4">
                @php
                    $domains = [
                        ['1', 'Tata Kelola', 'Tatanan institusi & tata kelola TI'],
                        ['2', 'Arsitektur', 'Arsitektur TI Bank'],
                        ['3', 'Manajemen Risiko', 'Manajemen risiko TI'],
                        ['4', 'Ketahanan & Keamanan Siber', 'Ketahanan dan keamanan siber'],
                        ['5', 'Teknologi', 'Adopsi TI & penyedia jasa TI'],
                        ['6', 'Data', 'Tata kelola & pelindungan data'],
                        ['7', 'Kolaborasi', 'Kemitraan & penyediaan jasa TI'],
                        ['8', 'Pelindungan Konsumen', 'Pelayanan & pelindungan konsumen'],
                    ];
                    $domainColors = ['bg-blue-600','bg-orange-500','bg-green-600','bg-pink-600','bg-violet-600','bg-cyan-600','bg-yellow-600','bg-red-600'];
                @endphp
                @foreach ($domains as $i => [$code, $name, $desc])
                    <div class="rounded-xl border border-gray-100 bg-gray-50 p-4 text-center">
                        <span class="inline-flex h-8 w-8 items-center justify-center rounded-full {{ $domainColors[$i] }} text-sm font-bold text-white">{{ $code }}</span>
                        <h4 class="mt-2 text-sm font-semibold text-gray-800">{{ $name }}</h4>
                        <p class="mt-1 text-[11px] leading-snug text-gray-500">{{ $desc }}</p>
                    </div>
                @endforeach
            </div>
        </div>
    </section>

    {{-- ===== Matriks Penetapan Tingkat Maturitas Digital ===== --}}
    <section id="matriks" class="bg-gradient-to-b from-gray-50 to-white py-16 lg:py-20 scroll-reveal">
        <div class="mx-auto max-w-6xl px-4 sm:px-6">
            <div class="text-center">
                <span class="inline-flex items-center rounded-full bg-accent-50 px-3 py-1 text-xs font-semibold text-accent-700 ring-1 ring-inset ring-accent-200">
                    Lampiran III — SEOJK No. 24/SEOJK.03/2023
                </span>
                <h2 class="mt-4 text-2xl font-bold text-gray-800 sm:text-3xl">Matriks Penetapan Tingkat Maturitas Digital</h2>
                <p class="mx-auto mt-3 max-w-2xl text-gray-500">
                    Penetapan tingkat maturitas digital Bank dikategorikan ke dalam 5 tingkat berdasarkan definisi berikut.
                </p>
            </div>

            <div class="mt-12 space-y-4">
                @php
                    $matrixLevels = [
                        [
                            'tingkat' => 1,
                            'label' => 'Sangat Tinggi',
                            'color' => 'green-600',
                            'bg' => 'bg-green-50',
                            'border' => 'border-green-200',
                            'badge_bg' => 'bg-green-600',
                            'ring' => 'ring-green-500/20',
                            'definisi' => 'Mencerminkan kondisi tingkat maturitas digital Bank yang secara umum sangat tinggi, tercermin dari seluruh aktivitas telah berjalan dengan sangat baik dan Bank telah menjalankan mekanisme continuous improvement. Dalam hal terdapat kelemahan maka secara umum kelemahan tersebut tidak signifikan.',
                        ],
                        [
                            'tingkat' => 2,
                            'label' => 'Tinggi',
                            'color' => 'green-400',
                            'bg' => 'bg-emerald-50',
                            'border' => 'border-emerald-200',
                            'badge_bg' => 'bg-emerald-500',
                            'ring' => 'ring-emerald-500/20',
                            'definisi' => 'Mencerminkan kondisi tingkat maturitas digital Bank yang secara umum tinggi, tercermin dari seluruh aktivitas yang dibutuhkan telah dilaksanakan secara konsisten. Dalam hal terdapat kelemahan maka secara umum kelemahan tersebut kurang signifikan.',
                        ],
                        [
                            'tingkat' => 3,
                            'label' => 'Cukup',
                            'color' => 'amber-400',
                            'bg' => 'bg-amber-50',
                            'border' => 'border-amber-200',
                            'badge_bg' => 'bg-amber-500',
                            'ring' => 'ring-amber-500/20',
                            'definisi' => 'Mencerminkan kondisi tingkat maturitas digital Bank secara umum cukup, tercermin dari sebagian besar aktivitas yang dibutuhkan telah dilaksanakan secara konsisten. Dalam hal terdapat kelemahan maka secara umum kelemahan tersebut cukup signifikan dan apabila tidak berhasil diatasi dengan baik oleh manajemen dapat mengganggu kelangsungan usaha Bank.',
                        ],
                        [
                            'tingkat' => 4,
                            'label' => 'Rendah',
                            'color' => 'orange-500',
                            'bg' => 'bg-orange-50',
                            'border' => 'border-orange-200',
                            'badge_bg' => 'bg-orange-500',
                            'ring' => 'ring-orange-500/20',
                            'definisi' => 'Mencerminkan kondisi tingkat maturitas digital Bank yang secara umum rendah, tercermin dari beberapa aktivitas atau proses yang dibutuhkan telah diidentifikasi, namun belum seluruhnya dilaksanakan secara konsisten. Terdapat kelemahan yang secara umum signifikan dan tidak dapat diatasi dengan baik oleh manajemen serta mengganggu kelangsungan usaha Bank.',
                        ],
                        [
                            'tingkat' => 5,
                            'label' => 'Sangat Rendah',
                            'color' => 'red-500',
                            'bg' => 'bg-red-50',
                            'border' => 'border-red-200',
                            'badge_bg' => 'bg-red-500',
                            'ring' => 'ring-red-500/20',
                            'definisi' => 'Mencerminkan kondisi tingkat maturitas digital Bank yang secara umum sangat rendah, tercermin dari aktivitas atau proses yang dibutuhkan belum diidentifikasi dan belum dilaksanakan. Terdapat kelemahan yang secara umum sangat signifikan sehingga untuk mengatasinya diperlukan dukungan dana dari pemegang saham atau sumber dana dari pihak lain untuk memperkuat tingkat maturitas digital pada Bank.',
                        ],
                    ];
                @endphp

                @foreach ($matrixLevels as $level)
                    <div class="group relative overflow-hidden rounded-xl border {{ $level['border'] }} {{ $level['bg'] }} transition-all hover:shadow-md">
                        <div class="flex flex-col gap-4 p-5 sm:flex-row sm:items-start sm:gap-6 sm:p-6">
                            <div class="flex shrink-0 items-center gap-3 sm:w-48">
                                <span class="flex h-10 w-10 items-center justify-center rounded-lg {{ $level['badge_bg'] }} text-lg font-bold text-white shadow-sm">
                                    {{ $level['tingkat'] }}
                                </span>
                                <div>
                                    <div class="text-sm font-bold text-gray-800">Tingkat {{ $level['tingkat'] }}</div>
                                    <div class="text-xs font-medium text-gray-500">{{ $level['label'] }}</div>
                                </div>
                            </div>
                            <p class="text-sm leading-relaxed text-gray-600">{{ $level['definisi'] }}</p>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>

    {{-- ===== Fitur ===== --}}
    <section id="fitur" class="bg-gray-50 py-16 lg:py-20 scroll-reveal">
        <div class="mx-auto max-w-6xl px-4 sm:px-6">
            <div class="text-center">
                <h2 class="text-2xl font-bold text-gray-800 sm:text-3xl">Apa yang Dilakukan Aplikasi Ini?</h2>
                <p class="mx-auto mt-3 max-w-2xl text-gray-600">
                    Mendigitalisasi seluruh alur kertas kerja assessment maturitas digital — dari pengisian, penelaahan, hingga pelaporan.
                </p>
            </div>

            <div class="mt-12 grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
                @php
                    $features = [
                        [
                            'title' => 'Pengisian Assessment',
                            'desc' => 'Assessor (PIC Divisi) mengisi status setiap sub-kontrol — Ada, Partial, atau Tidak Ada — beserta penjelasan, dokumen pendukung, dan rekomendasi perbaikan.',
                            'icon' => 'M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z',
                            'tone' => 'primary',
                        ],
                        [
                            'title' => 'Skoring Otomatis',
                            'desc' => 'Sistem menghitung persentase dan peringkat maturitas (Tingkat 1–5) secara otomatis per kontrol, subdomain, dan domain sesuai skala OJK.',
                            'icon' => 'M9 7h6m0 10v-3m-3 3h.01M9 17h.01M9 14h.01M12 14h.01M15 11h.01M12 11h.01M9 11h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z',
                            'tone' => 'accent',
                        ],
                        [
                            'title' => 'Review & Validasi',
                            'desc' => 'Reviewer menelaah seluruh isian assessor, memvalidasi kelengkapan dokumen, dan menetapkan status review (Pending, In Progress, Done) per kontrol.',
                            'icon' => 'M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z',
                            'tone' => 'primary',
                        ],
                        [
                            'title' => 'Dashboard Interaktif',
                            'desc' => 'Visualisasi skor maturitas per domain melalui bar chart, distribusi kategori via pie chart, tabel perbandingan skor antar tahun, dan chart detail per kontrol.',
                            'icon' => 'M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 013 19.875v-6.75zM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V8.625zM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 01-1.125-1.125V4.125z',
                            'tone' => 'accent',
                        ],
                        [
                            'title' => 'Export Laporan',
                            'desc' => 'Unduh laporan lengkap dalam format Excel (4 sheet dengan chart) atau PDF — mencakup dashboard skor, hasil per kontrol, detail penilaian, dan status review.',
                            'icon' => 'M3 16.5v2.25A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75V16.5M16.5 12L12 16.5m0 0L7.5 12m4.5 4.5V3',
                            'tone' => 'primary',
                        ],
                        [
                            'title' => 'Manajemen & Penugasan',
                            'desc' => 'Admin mengelola periode assessment, akun pengguna, divisi, dan menugaskan PIC divisi ke masing-masing kontrol untuk pembagian tanggung jawab pengisian.',
                            'icon' => 'M10.5 6h9.75M10.5 6a1.5 1.5 0 11-3 0m3 0a1.5 1.5 0 10-3 0M3.75 6H7.5m3 12h9.75m-9.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-3.75 0H7.5m9-6h3.75m-3.75 0a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m-9.75 0h9.75',
                            'tone' => 'accent',
                        ],
                    ];
                @endphp
                @foreach ($features as $feature)
                    <div class="rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
                        <div class="flex h-11 w-11 items-center justify-center rounded-lg {{ $feature['tone'] === 'accent' ? 'bg-accent-50 text-accent-600' : 'bg-primary-50 text-primary-600' }}">
                            <svg class="h-6 w-6" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" d="{{ $feature['icon'] }}" />
                            </svg>
                        </div>
                        <h3 class="mt-4 font-semibold text-gray-800">{{ $feature['title'] }}</h3>
                        <p class="mt-2 text-sm leading-relaxed text-gray-600">{{ $feature['desc'] }}</p>
                    </div>
                @endforeach
            </div>
        </div>
    </section>

    {{-- ===== Footer ===== --}}
    <footer class="border-t border-gray-100 bg-white scroll-reveal">
        <div class="mx-auto flex max-w-6xl flex-col items-center justify-between gap-3 px-4 py-6 text-sm text-gray-500 sm:flex-row sm:px-6">
            <div class="flex items-center gap-2">
                <x-application-logo class="h-7 w-auto" />
                <span>© {{ date('Y') }} PT Bank Sumut — Assessment Maturitas Digital</span>
            </div>
            <span class="text-xs">SEOJK No. 24/SEOJK.03/2023</span>
        </div>
    </footer>


    <script>
        // Active navbar link via IntersectionObserver
        const sections = document.querySelectorAll('section[id]');
        const navLinks = document.querySelectorAll('.nav-link[data-section]');

        const observerOptions = {
            root: null,
            rootMargin: '-20% 0px -70% 0px',
            threshold: 0,
        };

        const sectionObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    navLinks.forEach(link => {
                        link.classList.toggle('active', link.dataset.section === entry.target.id);
                    });
                }
            });
        }, observerOptions);

        sections.forEach(section => sectionObserver.observe(section));

        // Scroll-reveal animation
        const revealElements = document.querySelectorAll('.scroll-reveal');

        const revealObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    revealObserver.unobserve(entry.target);
                }
            });
        }, { threshold: 0.1 });

        revealElements.forEach(el => revealObserver.observe(el));
    </script>
</body>
</html>
