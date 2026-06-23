<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <title>Laporan Assessment {{ $period->year }}</title>
    
    {{-- Memuat Tailwind CSS (versi statis agar aman untuk PDF Generator) --}}
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">

    <style>
        /* Penyesuaian khusus untuk PDF agar rapi dan stabil */
        body { font-family: DejaVu Sans, sans-serif; font-size: 11px; color: #1f2937; }
        
        /* Typography overrides */
        h2 { font-size: 14px; margin-top: 24px; margin-bottom: 12px; color: #00529C; border-bottom: 2px solid #F58220; padding-bottom: 4px; font-weight: bold; }
        h3.domain-title { font-size: 12px; margin-top: 16px; margin-bottom: 8px; padding: 6px 10px; color: #fff; border-radius: 4px; }
        
        /* Pengganti class table Bootstrap agar kompatibel dengan DOMPDF/Snappy */
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #e5e7eb; padding: 4px 6px; font-size: 11px; vertical-align: middle; }
        th { text-align: left; font-weight: bold; }
        .table-striped tbody tr:nth-child(even) { background-color: #f9fafb; }
        .table-hover tbody tr:hover { background-color: #f3f4f6; }
        
        /* Custom Bars for Visualization */
        .bar-cell { width: 160px; padding: 4px; vertical-align: middle; }
        .bar { height: 14px; border-radius: 3px; }
        .bar-1 { background-color: #16a34a; }
        .bar-2 { background-color: #4ade80; }
        .bar-3 { background-color: #fbbf24; }
        .bar-4 { background-color: #f97316; }
        .bar-5 { background-color: #ef4444; }

        /* Custom Dots for Categories */
        .cat-dot { display: inline-block; width: 10px; height: 10px; border-radius: 50%; margin-right: 6px; vertical-align: middle; }
        .cat-1 { background-color: #16a34a; }
        .cat-2 { background-color: #4ade80; }
        .cat-3 { background-color: #fbbf24; }
        .cat-4 { background-color: #f97316; }
        .cat-5 { background-color: #ef4444; }

        /* Utilities */
        .page-break { page-break-before: always; }
        .total-row td { background-color: #eef2ff !important; font-weight: bold; }
        .bg-orange-soft { background-color: #FFF7ED; color: #9A3412; border: 1px solid #fed7aa; }
    </style>
</head>
<body class="p-4">

    {{-- ── Header ──────────────────────────────────────────── --}}
    <div class="mb-4">
        <h1 class="text-lg font-bold" style="color: #00529C;">Laporan Assessment Maturitas Digital — PT Bank Sumut</h1>
        <p class="text-gray-500 mb-2" style="font-size: 10px;">
            {{ $period->name }} · Tahun {{ $period->year }} ·
            Referensi: SEOJK No. 24/SEOJK.03/2023 · Dicetak {{ now()->format('d M Y H:i') }}
        </p>
        <div class="mt-3 font-bold" style="font-size: 12px;">
            Skor Total: <span class="text-gray-900">{{ $overallSkor ?? '—' }}</span> 
            <span class="mx-2 text-gray-500">|</span>
            Nilai: <span class="inline-block rounded bg-orange-soft py-1 px-2">{{ $overallNilai ?? '—' }} — {{ $overallCategory ?? '—' }}</span>
        </div>
    </div>

    {{-- ── Ringkasan per Domain ────────────────────────────── --}}
    <h2>Ringkasan Skor per Domain</h2>
    <div class="overflow-x-auto">
        <table>
            <thead class="bg-gray-100">
                <tr>
                    <th>Domain</th>
                    <th class="text-center" style="width: 80px;">Skor</th>
                    <th class="text-center" style="width: 80px;">Nilai</th>
                    <th style="width: 220px;">Kategori</th>
                    <th class="bar-cell text-center">Visualisasi Skor</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($domainRows as $d)
                    @php
                        $skor  = $d['cache']->skor ?? null;
                        $nilai = $d['cache']->nilai ?? null;
                        $barW  = $skor ? round(($skor / 5) * 150) : 0;
                    @endphp
                    <tr>
                        <td>{{ $d['code'] }}. {{ $d['name'] }}</td>
                        <td class="text-center">{{ $skor !== null ? number_format((float)$skor, 2) : '—' }}</td>
                        <td class="text-center font-bold">{{ $nilai ?? '—' }}</td>
                        <td>
                            @if ($nilai)<span class="cat-dot cat-{{ $nilai }}"></span>@endif
                            {{ $d['cache']->category ?? '—' }}
                        </td>
                        <td class="bar-cell align-middle">
                            @if ($barW > 0)<div class="bar bar-{{ $nilai }}" style="width: {{ $barW }}px;"></div>@endif
                        </td>
                    </tr>
                @endforeach
                <tr class="total-row">
                    <td>Total</td>
                    <td class="text-center">{{ $overallSkor !== null ? number_format($overallSkor, 2) : '—' }}</td>
                    <td class="text-center">{{ $overallNilai ?? '—' }}</td>
                    <td>
                        @if ($overallNilai)<span class="cat-dot cat-{{ $overallNilai }}"></span>@endif
                        {{ $overallCategory ?? '—' }}
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    {{-- ── Distribusi Kategori Kontrol ─────────────────────── --}}
    <h2>Distribusi Kategori Kontrol</h2>
    <div class="overflow-x-auto" style="max-width: 500px;">
        <table class="table-striped">
            <thead class="bg-gray-100">
                <tr>
                    <th class="text-center" style="width: 60px;">Nilai</th>
                    <th>Kategori</th>
                    <th class="text-center" style="width: 100px;">Jumlah</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($categoryDist as $n => $cat)
                    <tr>
                        <td class="text-center font-bold">{{ $n }}</td>
                        <td><span class="cat-dot cat-{{ $n }}"></span> {{ $cat['label'] }}</td>
                        <td class="text-center">{{ $cat['count'] }}</td>
                    </tr>
                @endforeach
                @if ($notScored > 0)
                    <tr>
                        <td class="text-center">—</td>
                        <td class="text-gray-500 italic">Belum Dinilai</td>
                        <td class="text-center">{{ $notScored }}</td>
                    </tr>
                @endif
            </tbody>
        </table>
    </div>

    {{-- ── Hasil Penilaian per Kontrol (per domain) ────────── --}}
    @php
        $domainColorMap = [
            '2563eb', 'f58220', '16a34a', 'db2777',
            '7c3aed', '0891b2', 'ca8a04', 'dc2626',
        ];
    @endphp

    <div class="page-break"></div>
    <h2>Hasil Penilaian Maturitas per Kontrol</h2>

    @foreach ($domainCharts as $i => $dc)
        <h3 class="domain-title shadow-sm" style="background-color: #{{ $domainColorMap[$i % 8] }};">
            {{ $dc['code'] }}. {{ $dc['name'] }}
        </h3>
        <div class="overflow-x-auto mb-3">
            <table>
                <thead class="bg-gray-100">
                    <tr>
                        <th style="width: 90px;">Kode</th>
                        <th class="text-center" style="width: 70px;">Nilai</th>
                        <th>Kategori</th>
                        <th class="bar-cell text-center">Visualisasi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($dc['labels'] as $j => $label)
                        @php
                            $val = $dc['data'][$j];
                            $barW = $val > 0 ? round(($val / 5) * 140) : 0;
                        @endphp
                        <tr>
                            <td class="font-bold">{{ $label }}</td>
                            <td class="text-center font-bold">{{ $val > 0 ? $val : '—' }}</td>
                            <td>
                                @if ($val > 0)
                                    <span class="cat-dot cat-{{ $val }}"></span>
                                    {{ \App\Services\ScoringService::CATEGORY[$val] ?? '' }}
                                @else
                                    <span class="text-gray-500 italic">Belum Dinilai</span>
                                @endif
                            </td>
                            <td class="bar-cell align-middle">
                                @if ($barW > 0)
                                    <div class="bar bar-{{ $val }}" style="width: {{ $barW }}px;"></div>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    @endforeach

    {{-- ── Detail per Kontrol ──────────────────────────────── --}}
    <div class="page-break"></div>
    <h2>Detail Penilaian per Kontrol</h2>
    <div class="overflow-x-auto">
        <table class="table-hover">
            <thead class="bg-gray-100">
                <tr>
                    <th style="width: 60px;">Kode</th>
                    <th style="width: 150px;">Domain</th>
                    <th>Kontrol</th>
                    <th class="text-center" style="width: 60px;">%</th>
                    <th class="text-center" style="width: 60px;">Nilai</th>
                    <th style="width: 180px;">Kategori</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($rows as $r)
                    <tr>
                        <td class="font-bold">{{ $r['code'] }}</td>
                        <td>{{ $r['domain'] }}</td>
                        <td>{{ \Illuminate\Support\Str::limit($r['title'], 85) }}</td>
                        <td class="text-center">{{ $r['percentage'] !== null ? number_format((float)$r['percentage'], 1) : '—' }}</td>
                        <td class="text-center font-bold">{{ $r['nilai'] ?? '—' }}</td>
                        <td>
                            @if ($r['nilai'])<span class="cat-dot cat-{{ $r['nilai'] }}"></span>@endif
                            {{ $r['category'] ?? '—' }}
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

</body>
</html>