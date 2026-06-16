<table>
    <thead>
        <tr><th colspan="6">Laporan Assessment Maturitas Digital — {{ $period->name }} ({{ $period->year }})</th></tr>
        <tr><th colspan="6">Nilai Total: {{ $overallNilai ?? '-' }}</th></tr>
        <tr></tr>
    </thead>
</table>

<table>
    <thead>
        <tr><th colspan="3">Ringkasan per Domain</th></tr>
        <tr>
            <th>Domain</th>
            <th>Persentase (%)</th>
            <th>Nilai</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($domainRows as $row)
            <tr>
                <td>{{ $row['code'] }}. {{ $row['name'] }}</td>
                <td>{{ $row['cache']->percentage ?? '' }}</td>
                <td>{{ $row['cache']->nilai ?? '' }}</td>
            </tr>
        @endforeach
    </tbody>
</table>

<table>
    <thead>
        <tr></tr>
        <tr><th colspan="7">Detail per Kontrol</th></tr>
        <tr>
            <th>Kode</th>
            <th>Domain</th>
            <th>Sub-domain</th>
            <th>Kontrol</th>
            <th>Persentase (%)</th>
            <th>Nilai</th>
            <th>Status Review</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($rows as $r)
            <tr>
                <td>{{ $r['code'] }}</td>
                <td>{{ $r['domain'] }}</td>
                <td>{{ $r['subdomain'] }}</td>
                <td>{{ $r['title'] }}</td>
                <td>{{ $r['percentage'] ?? '' }}</td>
                <td>{{ $r['nilai'] ?? '' }}</td>
                <td>{{ $r['review'] }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
