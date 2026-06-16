<x-app-layout>
    <x-slot name="header">
        <h1 class="text-lg font-semibold text-gray-800">Export Laporan</h1>
    </x-slot>

    <div class="max-w-xl rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
        @if ($periods->isEmpty())
            <p class="text-gray-500">Belum ada periode assessment untuk diekspor.</p>
        @else
            {{-- Pemilih periode --}}
            <form method="GET" class="mb-4">
                <label for="period" class="block text-sm font-medium text-gray-700">Pilih Periode</label>
                <select id="period" name="period" onchange="this.form.submit()"
                        class="mt-1 w-full rounded-md border-gray-300 text-sm shadow-sm focus:border-primary-500 focus:ring-primary-500">
                    @foreach ($periods as $p)
                        <option value="{{ $p->id }}" @selected($period && $period->id == $p->id)>
                            {{ $p->name }} ({{ $p->year }}) — {{ $p->status === 'active' ? 'Aktif' : 'Selesai' }}
                        </option>
                    @endforeach
                </select>
            </form>

            @if ($period)
                <p class="text-sm text-gray-600">
                    Periode: <strong>{{ $period->name }}</strong> ({{ $period->year }}) —
                    <x-status-badge :status="$period->status" />
                </p>
                <p class="mt-1 text-xs text-gray-400">
                    Laporan berisi dashboard skor, chart per domain, detail 94 kontrol, dan status review.
                </p>

                <div class="mt-5 flex flex-wrap gap-3">
                    <a href="{{ route('reports.export', ['format' => 'excel', 'period' => $period->id]) }}"
                       class="inline-flex items-center gap-2 rounded-lg bg-primary-600 px-4 py-2 text-sm font-medium text-white hover:bg-primary-700">
                        Export Excel (.xlsx)
                    </a>
                    <a href="{{ route('reports.export', ['format' => 'pdf', 'period' => $period->id]) }}"
                       class="inline-flex items-center gap-2 rounded-lg bg-accent-600 px-4 py-2 text-sm font-medium text-white hover:bg-accent-700">
                        Export PDF
                    </a>
                </div>
            @endif
        @endif
    </div>
</x-app-layout>
