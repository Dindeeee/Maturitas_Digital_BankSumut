<x-app-layout>
    <x-slot name="header">
        <h1 class="text-lg font-semibold text-gray-800">Export Laporan</h1>
    </x-slot>

    <div class="mx-auto max-w-3xl space-y-6">

        {{-- Pemilih Periode --}}
        <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
            <label class="mb-2 block text-sm font-medium text-gray-700">Pilih Periode Assessment</label>
            <form method="GET">
                <select name="period" onchange="this.form.submit()"
                        class="w-full rounded-lg border border-gray-300 bg-white px-3 py-2.5 text-sm text-gray-800 shadow-sm focus:border-accent-500 focus:outline-none focus:ring-1 focus:ring-accent-500">
                    @foreach ($periods as $p)
                        <option value="{{ $p->id }}" @selected($period && $period->id == $p->id)>
                            {{ $p->name }} ({{ $p->year }})
                            @if ($p->status === 'active') — Aktif @endif
                        </option>
                    @endforeach
                </select>
            </form>
        </div>

        @if ($period)

        {{-- Info Periode --}}
        <div class="rounded-xl border border-accent-200 bg-accent-50 p-4">
            <div class="flex gap-3">
                <div class="shrink-0">
                    <svg class="mt-0.5 h-5 w-5 text-accent-600" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd" />
                    </svg>
                </div>
                <div class="space-y-1 text-sm">
                    <p class="font-semibold text-accent-800">{{ $period->name }}</p>
                    <p class="text-accent-700">
                        Tahun Asesmen: <strong>{{ $period->year }}</strong> &nbsp;·&nbsp;
                        Pelaporan: <strong>{{ $period->year + 1 }}</strong>
                    </p>
                    @if ($period->start_date || $period->end_date)
                    <p class="text-accent-600">
                        Periode: {{ $period->start_date?->format('d M Y') ?? '—' }} –
                                 {{ $period->end_date?->format('d M Y') ?? '—' }}
                    </p>
                    @endif
                    <div class="flex items-center gap-2 pt-1">
                        <span class="text-accent-600">Status:</span>
                        <x-status-badge :status="$period->status" />
                    </div>
                    <p class="pt-1 text-xs text-accent-500">
                        Laporan mencakup dashboard skor keseluruhan, visualisasi per domain, detail 94 kontrol, dan status review.
                    </p>
                </div>
            </div>
        </div>

        {{-- Kartu Export --}}
        <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">

            {{-- Excel --}}
            <a href="{{ route('reports.export', ['format' => 'excel', 'period' => $period->id]) }}"
               class="group flex flex-col gap-3 rounded-xl border border-green-200 bg-white p-5 shadow-sm transition hover:border-green-400 hover:shadow-md">
                <div class="flex items-center gap-3">
                    <div class="flex h-11 w-11 items-center justify-center rounded-xl bg-green-100 text-green-700 group-hover:bg-green-200">
                        <svg class="h-6 w-6" fill="none" stroke="currentColor" stroke-width="1.75" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 17V7m0 10a2 2 0 01-2 2H5a2 2 0 01-2-2V7a2 2 0 012-2h2a2 2 0 012 2m0 10a2 2 0 002 2h2a2 2 0 002-2M9 7a2 2 0 012-2h2a2 2 0 012 2m0 10V7m0 10a2 2 0 002 2h2a2 2 0 002-2V7a2 2 0 00-2-2h-2a2 2 0 00-2 2" />
                        </svg>
                    </div>
                    <div>
                        <p class="font-semibold text-gray-800">Export Excel</p>
                        <p class="text-xs text-gray-400">.xlsx</p>
                    </div>
                </div>
                <ul class="space-y-1 text-xs text-gray-500">
                    <li class="flex items-center gap-1.5">
                        <svg class="h-3.5 w-3.5 shrink-0 text-green-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" /></svg>
                        Dashboard Score (grafik bar per domain)
                    </li>
                    <li class="flex items-center gap-1.5">
                        <svg class="h-3.5 w-3.5 shrink-0 text-green-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" /></svg>
                        Hasil per Kontrol (nilai tiap kontrol)
                    </li>
                    <li class="flex items-center gap-1.5">
                        <svg class="h-3.5 w-3.5 shrink-0 text-green-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" /></svg>
                        Detail Kontrol (94 kontrol, filter otomatis)
                    </li>
                    <li class="flex items-center gap-1.5">
                        <svg class="h-3.5 w-3.5 shrink-0 text-green-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" /></svg>
                        Sheet Review (status per kontrol)
                    </li>
                </ul>
                <div class="mt-auto flex items-center justify-between rounded-lg bg-green-50 px-3 py-2">
                    <span class="text-sm font-medium text-green-700">Unduh Excel</span>
                    <svg class="h-4 w-4 text-green-600" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                    </svg>
                </div>
            </a>

            {{-- PDF --}}
            <a href="{{ route('reports.export', ['format' => 'pdf', 'period' => $period->id]) }}"
               class="group flex flex-col gap-3 rounded-xl border border-red-200 bg-white p-5 shadow-sm transition hover:border-red-400 hover:shadow-md">
                <div class="flex items-center gap-3">
                    <div class="flex h-11 w-11 items-center justify-center rounded-xl bg-red-100 text-red-700 group-hover:bg-red-200">
                        <svg class="h-6 w-6" fill="none" stroke="currentColor" stroke-width="1.75" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M7 21h10a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0012.586 3H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
                        </svg>
                    </div>
                    <div>
                        <p class="font-semibold text-gray-800">Export PDF</p>
                        <p class="text-xs text-gray-400">.pdf · landscape A4</p>
                    </div>
                </div>
                <ul class="space-y-1 text-xs text-gray-500">
                    <li class="flex items-center gap-1.5">
                        <svg class="h-3.5 w-3.5 shrink-0 text-red-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" /></svg>
                        Ringkasan skor domain + bar visual
                    </li>
                    <li class="flex items-center gap-1.5">
                        <svg class="h-3.5 w-3.5 shrink-0 text-red-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" /></svg>
                        Distribusi kategori maturitas
                    </li>
                    <li class="flex items-center gap-1.5">
                        <svg class="h-3.5 w-3.5 shrink-0 text-red-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" /></svg>
                        Hasil per kontrol (8 domain)
                    </li>
                    <li class="flex items-center gap-1.5">
                        <svg class="h-3.5 w-3.5 shrink-0 text-gray-300" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" /></svg>
                        <span class="text-gray-400">Sheet Review (hanya di Excel)</span>
                    </li>
                </ul>
                <div class="mt-auto flex items-center justify-between rounded-lg bg-red-50 px-3 py-2">
                    <span class="text-sm font-medium text-red-700">Unduh PDF</span>
                    <svg class="h-4 w-4 text-red-600" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                    </svg>
                </div>
            </a>

        </div>

        @else
        <div class="rounded-xl border border-gray-200 bg-white px-6 py-12 text-center shadow-sm">
            <svg class="mx-auto mb-3 h-10 w-10 text-gray-300" fill="none" stroke="currentColor" stroke-width="1.5" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />
            </svg>
            <p class="text-sm text-gray-500">Belum ada periode assessment yang tersedia untuk diekspor.</p>
        </div>
        @endif

    </div>
</x-app-layout>
