<x-app-layout>
    <x-slot name="header">
        <div>
            <h1 class="text-lg font-semibold text-gray-800">Dashboard</h1>
            <p class="text-xs text-gray-500">Ringkasan Asesmen Maturitas Digital Bank Sumut</p>
        </div>
    </x-slot>

    {{-- Banner --}}
    <div class="mb-6 overflow-hidden rounded-xl bg-gradient-to-r from-primary-700 to-primary-500 p-6 text-white shadow">
        <h2 class="text-xl font-semibold">Selamat datang, {{ auth()->user()->name }} 👋</h2>
        <p class="mt-1 text-sm text-primary-50/90">
            @if ($period)
                Periode: <strong>{{ $period->name }}</strong> ({{ $period->year }}).
            @else
                Belum ada periode asesmen.
            @endif
        </p>
    </div>

    @if ($role === 'assessor')
        {{-- ===== Dashboard Assessor ===== --}}
        <div class="grid grid-cols-1 gap-4 sm:grid-cols-3">
            <x-stat-card label="Divisi" :value="$division?->code ?? '—'" icon="grid" tone="primary" />
            <x-stat-card label="Kontrol Ditugaskan" :value="(string) $assigned" icon="clipboard" tone="primary" />
            <x-stat-card label="Sudah Dinilai" :value="$filled.' / '.$assigned" icon="check" tone="accent" />
        </div>

        <div class="mt-6 rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
            <div class="mb-2 flex items-center justify-between">
                <h3 class="font-semibold text-gray-800">Progress Pengisian</h3>
                <span class="text-sm font-medium text-gray-600">{{ $progressPct }}%</span>
            </div>
            <div class="h-3 w-full overflow-hidden rounded-full bg-gray-200">
                <div class="h-full rounded-full bg-primary-500" style="width: {{ $progressPct }}%"></div>
            </div>
            <a href="{{ route('assessment.index') }}" class="mt-4 inline-block text-sm font-medium text-primary-600 hover:text-primary-700">
                Buka lembar asesmen →
            </a>
        </div>
    @else
        {{-- ===== Dashboard Admin/Reviewer/Viewer ===== --}}
        @if (isset($periods) && $periods->count() > 1)
            <form method="GET" class="mb-4 flex items-center gap-2">
                <label for="period" class="text-sm text-gray-600">Tampilkan periode:</label>
                <select id="period" name="period" onchange="this.form.submit()"
                        class="rounded-md border-gray-300 text-sm shadow-sm focus:border-primary-500 focus:ring-primary-500">
                    @foreach ($periods as $pp)
                        <option value="{{ $pp->id }}" @selected($selectedPeriodId == $pp->id)>
                            {{ $pp->name }} ({{ $pp->year }}) — {{ ucfirst($pp->status) }}
                        </option>
                    @endforeach
                </select>
            </form>
        @endif

        <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
            <x-stat-card label="Domain" :value="(string) $totalDomain" icon="grid" tone="primary" />
            <x-stat-card label="Kontrol" :value="(string) $totalKontrol" icon="clipboard" tone="primary" />
            <x-stat-card label="Sub-kontrol" :value="(string) $totalSub" icon="check" tone="accent" />
            <x-stat-card label="Progress Pengisian" :value="$progressPct.'%'" icon="chart" tone="accent" />
        </div>

        <div class="mt-6 grid grid-cols-1 gap-6 lg:grid-cols-3">
            {{-- Bar overview: skor (1–5) per domain, warna KHAS tiap domain --}}
            <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm lg:col-span-2">
                <div class="mb-4 flex items-center justify-between">
                    <h3 class="font-semibold text-gray-800">Skor Maturitas per Domain (1–5)</h3>
                    @if ($overallSkor)
                        <span class="rounded-full bg-primary-50 px-2.5 py-1 text-xs font-medium text-primary-700">
                            Skor total {{ number_format($overallSkor, 2) }} · {{ $overallCategory }}
                        </span>
                    @endif
                </div>

                @if ($radar && array_sum($radar['data']) > 0)
                    <canvas id="barChart" height="120"></canvas>
                    <p class="mt-2 text-center text-xs text-gray-400">Skala 1–5 — makin kecil makin baik (Nilai 1 = Sangat Memadai)</p>
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            const el = document.getElementById('barChart');
                            if (!el || !window.Chart) return;
                            const radar = @json($radar);
                            const colors = @json($barColors);
                            new window.Chart(el, {
                                type: 'bar',
                                data: {
                                    labels: radar.labels,
                                    datasets: [{
                                        label: 'Skor (1–5)',
                                        data: radar.data,
                                        backgroundColor: colors,
                                        borderRadius: 6,
                                    }],
                                },
                                options: {
                                    plugins: {
                                        legend: { display: false },
                                        tooltip: { callbacks: { title: (items) => radar.names[items[0].dataIndex] } },
                                    },
                                    scales: {
                                        x: { ticks: { display: false } },
                                        y: { beginAtZero: true, max: 5, ticks: { stepSize: 1 } },
                                    },
                                },
                            });
                        });
                    </script>
                @else
                    <div class="flex h-64 items-center justify-center rounded-lg border-2 border-dashed border-gray-200 text-sm text-gray-400">
                        Belum ada data skor. Grafik akan tampil setelah asesmen diisi.
                    </div>
                @endif
            </div>

            {{-- Legenda kategori --}}
            <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
                <h3 class="mb-4 font-semibold text-gray-800">Kategori Maturitas (OJK)</h3>
                <ul class="space-y-3 text-sm">
                    <li class="flex flex-wrap items-center justify-between gap-1"><span class="flex items-center gap-2"><span class="h-3 w-3 shrink-0 rounded-full bg-green-600"></span> Sangat Memadai (Strong)</span><span class="text-gray-500">Nilai 1 · ≥85%</span></li>
                    <li class="flex flex-wrap items-center justify-between gap-1"><span class="flex items-center gap-2"><span class="h-3 w-3 shrink-0 rounded-full bg-green-400"></span> Memadai (Satisfactory)</span><span class="text-gray-500">Nilai 2 · 61–84%</span></li>
                    <li class="flex flex-wrap items-center justify-between gap-1"><span class="flex items-center gap-2"><span class="h-3 w-3 shrink-0 rounded-full bg-amber-400"></span> Cukup Memadai (Fair)</span><span class="text-gray-500">Nilai 3 · 41–60%</span></li>
                    <li class="flex flex-wrap items-center justify-between gap-1"><span class="flex items-center gap-2"><span class="h-3 w-3 shrink-0 rounded-full bg-orange-500"></span> Kurang Memadai (Marginal)</span><span class="text-gray-500">Nilai 4 · 21–40%</span></li>
                    <li class="flex flex-wrap items-center justify-between gap-1"><span class="flex items-center gap-2"><span class="h-3 w-3 shrink-0 rounded-full bg-red-500"></span> Tidak Memadai (Unsatisfactory)</span><span class="text-gray-500">Nilai 5 · ≤20%</span></li>
                </ul>
            </div>
        </div>

        {{-- Bar chart PER-DOMAIN: nilai (1–5) tiap kontrol, dengan label angka di tiap bar --}}
        @if (!empty($domainCharts) && $radar && array_sum($radar['data']) > 0)
            <div class="mt-6">
                <div class="mb-3 flex flex-wrap items-center justify-between gap-2">
                    <h3 class="font-semibold text-gray-800">Hasil Penilaian Maturitas per Kontrol</h3>
                    <span class="text-xs text-gray-400">Sumbu Y: Nilai 1–5 (makin kecil makin baik)</span>
                </div>
                <div class="grid grid-cols-1 gap-6 lg:grid-cols-2">
                    @foreach ($domainCharts as $i => $dc)
                        <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
                            <h4 class="mb-3 flex items-center gap-2 text-sm font-semibold text-gray-800">
                                <span class="h-3 w-3 shrink-0 rounded-sm" style="background: {{ $dc['color'] }}"></span>
                                Domain {{ $dc['code'] }} — {{ $dc['name'] }}
                            </h4>
                            <div style="position: relative; height: 220px;">
                                <canvas id="domChart{{ $i }}"></canvas>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    if (!window.Chart) return;

                    // Plugin kecil: tulis nilai di atas tiap bar (seperti contoh Excel).
                    const valueLabels = {
                        id: 'valueLabels',
                        afterDatasetsDraw(chart) {
                            const ctx = chart.ctx;
                            chart.getDatasetMeta(0).data.forEach(function (bar, i) {
                                const v = chart.data.datasets[0].data[i];
                                if (!v) return;
                                ctx.save();
                                ctx.fillStyle = '#374151';
                                ctx.font = '600 11px sans-serif';
                                ctx.textAlign = 'center';
                                ctx.fillText(v, bar.x, bar.y - 4);
                                ctx.restore();
                            });
                        },
                    };

                    const charts = @json($domainCharts);
                    charts.forEach(function (dc, i) {
                        const el = document.getElementById('domChart' + i);
                        if (!el) return;
                        new window.Chart(el, {
                            type: 'bar',
                            data: {
                                labels: dc.labels,
                                datasets: [{ label: 'Nilai', data: dc.data, backgroundColor: dc.color, borderRadius: 4 }],
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                layout: { padding: { top: 18 } },
                                plugins: {
                                    legend: { display: false },
                                    tooltip: { callbacks: { label: (c) => 'Nilai: ' + c.parsed.y } },
                                },
                                scales: {
                                    y: { beginAtZero: true, max: 5, ticks: { stepSize: 1 } },
                                    x: { ticks: { autoSkip: false, maxRotation: 90, minRotation: 45, font: { size: 9 } } },
                                },
                            },
                            plugins: [valueLabels],
                        });
                    });
                });
            </script>
        @endif

        {{-- Legenda warna domain + distribusi kontrol per kategori --}}
        @if ($radar && array_sum($radar['data']) > 0)
            <div class="mt-6 grid grid-cols-1 gap-6 lg:grid-cols-3">
                {{-- Legenda warna domain --}}
                <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm lg:col-span-2">
                    <h3 class="mb-4 font-semibold text-gray-800">Legenda Warna Domain</h3>
                    <div class="grid grid-cols-1 gap-x-6 gap-y-2 text-sm sm:grid-cols-2">
                        @foreach ($domainCharts as $dc)
                            <div class="flex items-center gap-2">
                                <span class="h-3 w-3 shrink-0 rounded-sm" style="background: {{ $dc['color'] }}"></span>
                                <span class="text-gray-700"><span class="font-semibold text-gray-900">{{ $dc['code'] }}.</span> {{ $dc['name'] }}</span>
                            </div>
                        @endforeach
                    </div>
                </div>

                {{-- Pie/doughnut chart: distribusi kontrol per kategori --}}
                <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
                    <h3 class="mb-4 font-semibold text-gray-800">Distribusi Kontrol per Kategori</h3>
                    <canvas id="pieChart"></canvas>
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            const el = document.getElementById('pieChart');
                            if (!el || !window.Chart) return;
                            const dist = @json($categoryDist);
                            new window.Chart(el, {
                                type: 'doughnut',
                                data: {
                                    labels: dist.labels,
                                    datasets: [{ data: dist.data, backgroundColor: dist.colors, borderWidth: 2, borderColor: '#ffffff' }],
                                },
                                options: {
                                    plugins: { legend: { position: 'bottom', labels: { boxWidth: 12, font: { size: 11 } } } },
                                },
                            });
                        });
                    </script>
                </div>
            </div>
        @endif

        {{-- Tabel skor per domain --}}
        <div class="mt-6 rounded-xl border border-gray-200 bg-white shadow-sm">
            <div class="border-b border-gray-100 px-5 py-3">
                <h3 class="font-semibold text-gray-800">Rincian Skor per Domain</h3>
            </div>
            <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 text-sm">
                <thead class="bg-gray-50 text-left text-xs uppercase tracking-wider text-gray-500">
                    <tr>
                        <th class="whitespace-nowrap px-4 py-3">Domain</th>
                        <th class="whitespace-nowrap px-4 py-3">Skor (1–5)</th>
                        <th class="whitespace-nowrap px-4 py-3">Kategori</th>
                        @if ($prevPeriod)
                            <th class="whitespace-nowrap px-4 py-3">Skor {{ $prevPeriod->year }}</th>
                            <th class="whitespace-nowrap px-4 py-3">Δ</th>
                        @endif
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @foreach ($domainRows as $row)
                        @php
                            $skor  = $row['cache']->skor ?? null;
                            $delta = ($skor !== null && $row['prevSkor'] !== null) ? round($row['prevSkor'] - $skor, 2) : null;
                        @endphp
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-3 text-gray-800"><span class="font-semibold text-primary-700">{{ $row['code'] }}.</span> {{ $row['name'] }}</td>
                            <td class="px-4 py-3 font-medium text-gray-800">{{ $skor !== null ? number_format($skor, 2) : '—' }}</td>
                            <td class="px-4 py-3 text-gray-600">{{ $row['cache']->category ?? '—' }}</td>
                            @if ($prevPeriod)
                                <td class="px-4 py-3 text-gray-500">{{ $row['prevSkor'] !== null ? number_format($row['prevSkor'], 2) : '—' }}</td>
                                <td class="px-4 py-3 text-xs {{ $delta > 0 ? 'text-green-600' : ($delta < 0 ? 'text-red-600' : 'text-gray-400') }}">
                                    {{ $delta !== null ? ($delta > 0 ? '▲ ' : ($delta < 0 ? '▼ ' : '')).number_format(abs($delta), 2) : '—' }}
                                </td>
                            @endif
                        </tr>
                    @endforeach
                </tbody>
            </table>
            </div>
        </div>
    @endif
</x-app-layout>
