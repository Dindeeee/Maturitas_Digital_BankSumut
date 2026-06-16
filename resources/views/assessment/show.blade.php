<x-app-layout>
    <x-slot name="header">
        <div class="flex items-center gap-2">
            <a href="{{ route('assessment.index') }}" class="text-gray-400 hover:text-gray-600">←</a>
            <h1 class="text-lg font-semibold text-gray-800">Kontrol {{ $control->code }}</h1>
        </div>
    </x-slot>

    <div class="mb-4 rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
        <p class="text-xs uppercase tracking-wide text-gray-400">
            {{ $control->subdomain->domain->name }} · {{ $control->subdomain->name }}
        </p>
        <p class="mt-1 text-sm text-gray-800">{{ $control->title }}</p>
    </div>

    <form method="POST" action="{{ route('assessment.store', $control) }}" class="space-y-6">
        @csrf

        {{-- Sub-kontrol --}}
        <div class="rounded-xl border border-gray-200 bg-white shadow-sm">
            <div class="border-b border-gray-100 px-5 py-3">
                <h2 class="font-semibold text-gray-800">Penilaian Sub-kontrol</h2>
                <p class="text-xs text-gray-500">Pilih status tiap kriteria: Ada (2) · Partial (1) · Tidak (0).</p>
            </div>
            <div class="divide-y divide-gray-100">
                @foreach ($control->subControls as $sub)
                    @php $cur = $subResults[$sub->id]->status ?? old("status.$sub->id"); @endphp
                    <div class="flex flex-col gap-3 px-5 py-4 sm:flex-row sm:items-start sm:justify-between">
                        <p class="text-sm text-gray-700 sm:max-w-2xl">
                            <span class="font-semibold text-gray-500">{{ $sub->label }}.</span>
                            {{ $sub->criteria_description }}
                        </p>
                        <div class="flex shrink-0 gap-1.5">
                            @foreach (['ada' => 'Ada', 'partial' => 'Partial', 'tidak' => 'Tidak'] as $val => $lbl)
                                <label class="cursor-pointer">
                                    <input type="radio" name="status[{{ $sub->id }}]" value="{{ $val }}"
                                           @checked($cur === $val) class="peer sr-only">
                                    <span class="block rounded-md border border-gray-300 px-3 py-1.5 text-xs text-gray-600
                                                 peer-checked:border-primary-600 peer-checked:bg-primary-600 peer-checked:text-white">
                                        {{ $lbl }}
                                    </span>
                                </label>
                            @endforeach
                        </div>
                    </div>
                @endforeach
            </div>
        </div>

        {{-- Penjelasan & rekomendasi tingkat kontrol --}}
        <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
            <h2 class="mb-4 font-semibold text-gray-800">Penjelasan & Rekomendasi</h2>
            <div class="space-y-4">
                @foreach ([
                    'penjelasan_aktor'   => 'Penjelasan: Aktor/Fungsi/Divisi',
                    'penjelasan_dokumen' => 'Penjelasan: Dokumen/Bukti',
                    'penjelasan_kontrol' => 'Penjelasan: Penerapan Kontrol',
                    'rekomendasi'        => 'Rekomendasi Perbaikan',
                    'referensi_dokumen'  => 'Referensi Dokumen',
                ] as $field => $label)
                    <div>
                        <x-input-label :for="$field" :value="$label" />
                        <textarea id="{{ $field }}" name="{{ $field }}" rows="3"
                                  class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500"
                        >{{ old($field, $acr->$field) }}</textarea>
                    </div>
                @endforeach
            </div>
        </div>

        <div class="flex items-center justify-end gap-3">
            <a href="{{ route('assessment.index') }}" class="text-sm text-gray-500 hover:text-gray-700">Kembali</a>
            <x-primary-button>Simpan & Hitung Skor</x-primary-button>
        </div>
    </form>
</x-app-layout>
