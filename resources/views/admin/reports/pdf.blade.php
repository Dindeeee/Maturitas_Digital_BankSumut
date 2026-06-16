<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <title>Laporan Assessment {{ $period->year }}</title>
    <style>
        * { font-family: DejaVu Sans, sans-serif; margin: 0; padding: 0; }
        body { font-size: 9px; color: #1f2937; }

        .header { margin-bottom: 14px; }
        .header h1 { font-size: 15px; color: #00529C; }
        .header .sub { font-size: 9px; color: #6b7280; margin-top: 2px; }
        .overall { margin-top: 6px; font-size: 11px; font-weight: bold; }
        .badge { background: #FFF7ED; color: #9A3412; padding: 2px 8px; border-radius: 4px; font-size: 10px; }

        h2 { font-size: 11px; margin: 16px 0 6px; color: #00529C; border-bottom: 2px solid #F58220; padding-bottom: 3px; }
        h3 { font-size: 10px; margin: 10px 0 4px; padding: 3px 6px; color: #fff; border-radius: 3px; }

        table { width: 100%; border-collapse: collapse; margin-top: 4px; }
        th, td { border: 1px solid #d1d5db; padding: 3px 5px; text-align: left; vertical-align: top; }
        th { background: #f3f4f6; font-weight: bold; font-size: 9px; }
        .center { text-align: center; }
        .bold   { font-weight: bold; }

        .bar-cell { width: 160px; padding: 2px 4px; }
        .bar { height: 12px; border-radius: 2px; }
        .bar-1 { background: #16a34a; }
        .bar-2 { background: #4ade80; }
        .bar-3 { background: #fbbf24; }
        .bar-4 { background: #f97316; }
        .bar-5 { background: #ef4444; }

        .cat-dot { display: inline-block; width: 8px; height: 8px; border-radius: 50%; margin-right: 4px; vertical-align: middle; }
        .cat-1 { background: #16a34a; }
        .cat-2 { background: #4ade80; }
        .cat-3 { background: #fbbf24; }
        .cat-4 { background: #f97316; }
        .cat-5 { background: #ef4444; }

        .total-row td { background: #eef2ff; font-weight: bold; }

        .page-break { page-break-before: always; }
    </style>
</head>
<body>
    {{-- ── Header ──────────────────────────────────────────── --}}
    <div class="header">
        <h1>Laporan Assessment Maturitas Digital — PT Bank Sumut</h1>
        <p class="sub">
            {{ $period->name }} · Tahun {{ $period->year }} ·
            Referensi: SEOJK No. 24/SEOJK.03/2023 · Dicetak {{ now()->format('d M Y H:i') }}
        </p>
        <p class="overall">
            Skor Total: {{ $overallSkor ?? '—' }} &nbsp;|&nbsp;
            Nilai: <span class="badge">{{ $overallNilai ?? '—' }} — {{ $overallCategory ?? '—' }}</span>
        </p>
    </div>

    {{-- ── Ringkasan per Domain ────────────────────────────── --}}
    <h2>Ringkasan Skor per Domain</h2>
    <table>
        <thead>
            <tr>
                <th>Domain</th>
                <th class="center" style="width:55px;">Skor</th>
                <th class="center" style="width:40px;">Nilai</th>
                <th style="width:180px;">Kategori</th>
                <th class="bar-cell">Visualisasi Skor</th>
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
                    <td class="center">{{ $skor !== null ? number_format((float)$skor, 2) : '—' }}</td>
                    <td class="center bold">{{ $nilai ?? '—' }}</td>
                    <td>
                        @if ($nilai)<span class="cat-dot cat-{{ $nilai }}"></span>@endif
                        {{ $d['cache']->category ?? '—' }}
                    </td>
                    <td class="bar-cell">
                        @if ($barW > 0)<div class="bar bar-{{ $nilai }}" style="width: {{ $barW }}px;"></div>@endif
                    </td>
                </tr>
            @endforeach
            <tr class="total-row">
                <td>Total</td>
                <td class="center">{{ $overallSkor !== null ? number_format($overallSkor, 2) : '—' }}</td>
                <td class="center">{{ $overallNilai ?? '—' }}</td>
                <td>
                    @if ($overallNilai)<span class="cat-dot cat-{{ $overallNilai }}"></span>@endif
                    {{ $overallCategory ?? '—' }}
                </td>
                <td></td>
            </tr>
        </tbody>
    </table>

    {{-- ── Distribusi Kategori Kontrol ─────────────────────── --}}
    <h2>Distribusi Kategori Kontrol</h2>
    <table style="width: 420px;">
        <thead>
            <tr>
                <th style="width:30px;">Nilai</th>
                <th>Kategori</th>
                <th class="center" style="width:70px;">Jumlah</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($categoryDist as $n => $cat)
                <tr>
                    <td class="center bold">{{ $n }}</td>
                    <td><span class="cat-dot cat-{{ $n }}"></span> {{ $cat['label'] }}</td>
                    <td class="center">{{ $cat['count'] }}</td>
                </tr>
            @endforeach
            @if ($notScored > 0)
                <tr>
                    <td class="center">—</td>
                    <td style="color:#9ca3af;">Belum Dinilai</td>
                    <td class="center">{{ $notScored }}</td>
                </tr>
            @endif
        </tbody>
    </table>

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
        <h3 style="background-color: #{{ $domainColorMap[$i % 8] }};">
            {{ $dc['code'] }}. {{ $dc['name'] }}
        </h3>
        <table>
            <thead>
                <tr>
                    <th style="width:70px;">Kode</th>
                    <th class="center" style="width:40px;">Nilai</th>
                    <th>Kategori</th>
                    <th class="bar-cell">Visualisasi</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($dc['labels'] as $j => $label)
                    @php
                        $val = $dc['data'][$j];
                        $barW = $val > 0 ? round(($val / 5) * 140) : 0;
                    @endphp
                    <tr>
                        <td class="bold">{{ $label }}</td>
                        <td class="center bold">{{ $val > 0 ? $val : '—' }}</td>
                        <td>
                            @if ($val > 0)
                                <span class="cat-dot cat-{{ $val }}"></span>
                                {{ \App\Services\ScoringService::CATEGORY[$val] ?? '' }}
                            @else
                                <span style="color:#9ca3af;">Belum Dinilai</span>
                            @endif
                        </td>
                        <td class="bar-cell">
                            @if ($barW > 0)
                                <div class="bar bar-{{ $val }}" style="width: {{ $barW }}px;"></div>
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endforeach

    {{-- ── Detail per Kontrol ──────────────────────────────── --}}
    <div class="page-break"></div>
    <h2>Detail Penilaian per Kontrol</h2>
    <table>
        <thead>
            <tr>
                <th style="width:50px;">Kode</th>
                <th>Domain</th>
                <th>Kontrol</th>
                <th class="center" style="width:45px;">%</th>
                <th class="center" style="width:35px;">Nilai</th>
                <th style="width:150px;">Kategori</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($rows as $r)
                <tr>
                    <td>{{ $r['code'] }}</td>
                    <td>{{ $r['domain'] }}</td>
                    <td>{{ \Illuminate\Support\Str::limit($r['title'], 85) }}</td>
                    <td class="center">{{ $r['percentage'] !== null ? number_format((float)$r['percentage'], 1) : '—' }}</td>
                    <td class="center bold">{{ $r['nilai'] ?? '—' }}</td>
                    <td>
                        @if ($r['nilai'])<span class="cat-dot cat-{{ $r['nilai'] }}"></span>@endif
                        {{ $r['category'] ?? '—' }}
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
