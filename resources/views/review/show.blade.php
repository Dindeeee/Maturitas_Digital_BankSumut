<x-app-layout>
    <x-slot name="header">
        <div class="flex items-center gap-2">
            <a href="{{ route('review.index', auth()->user()->role !== 'reviewer' ? ['period' => $period->id] : []) }}" class="text-gray-400 hover:text-gray-600">←</a>
            <h1 class="text-lg font-semibold text-gray-800">Review Kontrol {{ $control->code }}</h1>
        </div>
    </x-slot>

    {{-- Ringkasan kontrol + skor --}}
    <div class="mb-4 flex flex-col gap-3 rounded-xl border border-gray-200 bg-white p-5 shadow-sm sm:flex-row sm:items-center sm:justify-between">
        <div>
            <p class="text-xs uppercase tracking-wide text-gray-400">
                {{ $control->subdomain->domain->name }} · {{ $control->subdomain->name }}
            </p>
            <p class="mt-1 text-sm text-gray-800">{{ $control->title }}</p>
        </div>
        <div class="shrink-0 text-right">
            @if ($score)
                <p class="text-2xl font-semibold text-gray-800">{{ $score->percentage }}%</p>
                <p class="text-xs text-gray-500">Nilai {{ $score->nilai }} · {{ $score->category }}</p>
            @else
                <p class="text-sm text-gray-400">Belum dinilai</p>
            @endif
        </div>
    </div>

    {{-- Detail isian sub-kontrol (read-only) --}}
    <div class="mb-4 rounded-xl border border-gray-200 bg-white shadow-sm">
        <div class="border-b border-gray-100 px-5 py-3">
            <h2 class="font-semibold text-gray-800">Isian Sub-kontrol oleh Assessor</h2>
        </div>
        <div class="divide-y divide-gray-100">
            @foreach ($control->subControls as $sub)
                @php $sr = $subResults[$sub->id] ?? null; @endphp
                <div class="flex flex-col gap-2 px-5 py-3 sm:flex-row sm:items-start sm:justify-between sm:gap-3">
                    <p class="text-sm text-gray-700 sm:max-w-2xl">
                        <span class="font-semibold text-gray-500">{{ $sub->label }}.</span>
                        {{ $sub->criteria_description }}
                    </p>
                    <div class="shrink-0 sm:text-right">
                        @if ($sr && $sr->status)
                            <span class="inline-flex rounded-md px-2.5 py-1 text-xs font-medium
                                @class([
                                    'bg-primary-100 text-primary-700' => $sr->status === 'ada',
                                    'bg-accent-100 text-accent-700'   => $sr->status === 'partial',
                                    'bg-red-100 text-red-700'         => $sr->status === 'tidak',
                                ])">
                                {{ ucfirst($sr->status) }} ({{ $sr->skor }})
                            </span>
                        @else
                            <span class="text-xs italic text-gray-400">belum diisi</span>
                        @endif
                    </div>
                </div>
            @endforeach
        </div>
    </div>

    {{-- Penjelasan & rekomendasi (read-only) --}}
    <div class="mb-4 grid grid-cols-1 gap-4 rounded-xl border border-gray-200 bg-white p-5 shadow-sm sm:grid-cols-2">
        @foreach ([
            'penjelasan_aktor'   => 'Aktor/Fungsi/Divisi',
            'penjelasan_dokumen' => 'Dokumen/Bukti',
            'penjelasan_kontrol' => 'Penerapan Kontrol',
            'rekomendasi'        => 'Rekomendasi Perbaikan',
            'referensi_dokumen'  => 'Referensi Dokumen',
        ] as $field => $label)
            <div>
                <p class="text-xs font-medium uppercase tracking-wide text-gray-400">{{ $label }}</p>
                <p class="mt-1 whitespace-pre-line text-sm text-gray-700">{{ $acr->$field ?: '—' }}</p>
            </div>
        @endforeach
    </div>

    {{-- Status review (form untuk reviewer; baca-saja untuk viewer/pimpinan) --}}
    <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
        <h2 class="mb-3 font-semibold text-gray-800">Status Review</h2>
        @if ($acr->reviewed_at)
            <p class="mb-3 text-xs text-gray-500">
                Terakhir ditinjau {{ $acr->reviewed_at->format('d M Y H:i') }}
                @if ($acr->reviewer) oleh {{ $acr->reviewer->name }} @endif
            </p>
        @endif
        @if (auth()->user()->role === 'reviewer')
            <form method="POST" action="{{ route('review.update', $acr) }}" class="flex flex-wrap items-end gap-3">
                @csrf @method('PATCH')
                <div>
                    <x-input-label for="review_progress" value="Status" />
                    <select id="review_progress" name="review_progress"
                            class="mt-1 rounded-md border-gray-300 text-sm shadow-sm focus:border-primary-500 focus:ring-primary-500">
                        @foreach (['pending' => 'Pending', 'in_progress' => 'Sedang Diproses', 'done' => 'Selesai'] as $val => $lbl)
                            <option value="{{ $val }}" @selected($acr->review_progress === $val)>{{ $lbl }}</option>
                        @endforeach
                    </select>
                </div>
                <x-primary-button>Simpan Status</x-primary-button>
            </form>
        @else
            <x-status-badge :status="$acr->review_progress" />
        @endif
    </div>
</x-app-layout>
