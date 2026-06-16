<x-app-layout>
    <x-slot name="header">
        <h1 class="text-lg font-semibold text-gray-800">Buat Periode Assessment</h1>
    </x-slot>

    <div class="max-w-2xl rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
        <form method="POST" action="{{ route('admin.periods.store') }}" class="space-y-5">
            @csrf

            <div>
                <x-input-label for="year" value="Tahun" />
                <x-text-input id="year" name="year" type="number" class="mt-1 block w-full"
                              :value="old('year', date('Y'))" required />
                <x-input-error :messages="$errors->get('year')" class="mt-1" />
            </div>

            <div>
                <x-input-label for="name" value="Nama Periode" />
                <x-text-input id="name" name="name" type="text" class="mt-1 block w-full"
                              :value="old('name')" placeholder="Assessment Maturitas Digital 2025" required />
                <x-input-error :messages="$errors->get('name')" class="mt-1" />
            </div>

            <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                <div>
                    <x-input-label for="start_date" value="Tanggal Mulai" />
                    <x-text-input id="start_date" name="start_date" type="date" class="mt-1 block w-full"
                                  :value="old('start_date')" required />
                    <x-input-error :messages="$errors->get('start_date')" class="mt-1" />
                </div>
                <div>
                    <x-input-label for="end_date" value="Tanggal Selesai" />
                    <x-text-input id="end_date" name="end_date" type="date" class="mt-1 block w-full"
                                  :value="old('end_date')" required />
                    <x-input-error :messages="$errors->get('end_date')" class="mt-1" />
                </div>
            </div>

            <div class="flex items-center gap-3 pt-2">
                <x-primary-button>Simpan Periode</x-primary-button>
                <a href="{{ route('admin.periods.index') }}" class="text-sm text-gray-500 hover:text-gray-700">Batal</a>
            </div>
        </form>
    </div>
</x-app-layout>
