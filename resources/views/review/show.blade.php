<x-app-layout>
    <x-slot name="header">
        <div class="flex items-center gap-3">
            <a href="{{ route('review.index', array_filter(['period' => auth()->user()->role !== 'reviewer' ? $period->id : null, 'domain_id' => request()->query('domain_id')])) }}"
               class="inline-flex items-center gap-1.5 rounded-lg border border-gray-300 bg-white px-3 py-1.5 text-sm font-medium text-gray-600 shadow-sm transition hover:bg-gray-50 hover:text-gray-800">
                <svg class="h-4 w-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7"/></svg>
                Kembali
            </a>
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

    {{-- Status review (form untuk reviewer; baca-saja untuk lainnya) --}}
    <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
        <h2 class="mb-3 font-semibold text-gray-800">Status Review</h2>
        @if ($acr->reviewed_at)
            <p class="mb-3 text-xs text-gray-500">
                Terakhir ditinjau {{ $acr->reviewed_at->format('d M Y H:i') }}
                @if ($acr->reviewer) oleh {{ $acr->reviewer->name }} @endif
            </p>
        @endif
        @if (auth()->user()->role === 'reviewer')
            <form method="POST" action="{{ route('review.update', array_filter(['result' => $acr->id, 'period' => request()->query('period'), 'domain_id' => request()->query('domain_id')])) }}" class="flex flex-wrap items-end gap-3">
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

    {{-- Approval (form untuk approval role; baca-saja untuk lainnya) --}}
    <div class="mt-4 rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
        <h2 class="mb-3 font-semibold text-gray-800">Approval Pimpinan</h2>
        @if ($acr->approved_at)
            <p class="mb-3 text-xs text-gray-500">
                {{ $acr->approval_status === 'approved' ? 'Disetujui' : 'Ditolak' }}
                pada {{ $acr->approved_at->format('d M Y H:i') }}
                @if ($acr->approver) oleh {{ $acr->approver->name }} @endif
            </p>
        @endif

        @if (auth()->user()->role === 'approval')
            <div class="flex flex-wrap gap-3">
                <form method="POST" action="{{ route('review.approve', array_filter(['result' => $acr->id, 'period' => request()->query('period'), 'domain_id' => request()->query('domain_id')])) }}">
                    @csrf @method('PATCH')
                    <input type="hidden" name="approval_status" value="approved">
                    <button type="submit"
                            class="inline-flex items-center gap-1.5 rounded-lg px-4 py-2 text-sm font-medium text-white shadow-sm
                            {{ $acr->approval_status === 'approved' ? 'bg-green-700' : 'bg-green-600 hover:bg-green-700' }}">
                        <svg class="h-4 w-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7"/></svg>
                        Setujui
                    </button>
                </form>
                <form method="POST" action="{{ route('review.approve', array_filter(['result' => $acr->id, 'period' => request()->query('period'), 'domain_id' => request()->query('domain_id')])) }}">
                    @csrf @method('PATCH')
                    <input type="hidden" name="approval_status" value="rejected">
                    <button type="submit"
                            class="inline-flex items-center gap-1.5 rounded-lg px-4 py-2 text-sm font-medium text-white shadow-sm
                            {{ $acr->approval_status === 'rejected' ? 'bg-red-700' : 'bg-red-600 hover:bg-red-700' }}">
                        <svg class="h-4 w-4" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/></svg>
                        Tolak
                    </button>
                </form>
            </div>
        @else
            @if ($acr->approval_status === 'approved')
                <span class="inline-flex rounded-full bg-green-100 px-3 py-1 text-sm font-medium text-green-700">Disetujui</span>
            @elseif ($acr->approval_status === 'rejected')
                <span class="inline-flex rounded-full bg-red-100 px-3 py-1 text-sm font-medium text-red-700">Ditolak</span>
            @else
                <span class="text-sm text-gray-400">Belum ada keputusan</span>
            @endif
        @endif
    </div>
</x-app-layout>
