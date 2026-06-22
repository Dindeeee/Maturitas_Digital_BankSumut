<x-app-layout>
    <x-slot name="header">
        <h1 class="text-lg font-semibold text-gray-800">Periode Assessment</h1>
    </x-slot>

    <div x-data="{
        showCreate: false,
        showEdit: false,
        showActivate: false,
        showComplete: false,
        showDelete: false,
        actionId: null,
        actionName: '',
        editId: null,
        editYear: '',
        editName: '',
        editStart: '',
        editEnd: '',
        openEdit(id, year, name, start, end) {
            this.editId = id;
            this.editYear = year;
            this.editName = name;
            this.editStart = start;
            this.editEnd = end;
            this.showEdit = true;
        },
        openDelete(id, name) {
            this.actionId = id;
            this.actionName = name;
            this.showDelete = true;
        },
    }">
        <div class="mb-4 flex justify-end">
            <button @click="showCreate = true"
                    class="inline-flex items-center gap-2 rounded-lg bg-primary-600 px-4 py-2 text-sm font-medium text-white hover:bg-primary-700">
                + Buat Periode
            </button>
        </div>

        <div class="rounded-xl border border-gray-200 bg-white shadow-sm">
            <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 text-sm">
                <thead class="bg-gray-50 text-left text-xs uppercase tracking-wider text-gray-500">
                    <tr>
                        <th class="whitespace-nowrap px-4 py-3">Tahun</th>
                        <th class="whitespace-nowrap px-4 py-3">Nama</th>
                        <th class="whitespace-nowrap px-4 py-3">Periode</th>
                        <th class="whitespace-nowrap px-4 py-3">Status</th>
                        <th class="whitespace-nowrap px-4 py-3 text-center">Kontrol</th>
                        <th class="whitespace-nowrap px-4 py-3 text-right">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @forelse ($periods as $period)
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-3 font-medium text-gray-800">{{ $period->year }}</td>
                            <td class="px-4 py-3 text-gray-700">{{ $period->name }}</td>
                            <td class="whitespace-nowrap px-4 py-3 text-gray-500">
                                {{ $period->start_date?->format('d M Y') }} – {{ $period->end_date?->format('d M Y') }}
                            </td>
                            <td class="px-4 py-3"><x-status-badge :status="$period->status" /></td>
                            <td class="px-4 py-3 text-center text-gray-600">{{ $period->control_results_count }}</td>
                            <td class="px-4 py-3">
                                <div class="flex justify-end gap-2">
                                    @if ($period->status === 'draft')
                                        <button @click="openEdit({{ $period->id }}, '{{ $period->year }}', '{{ addslashes($period->name) }}', '{{ $period->start_date?->format('Y-m-d') }}', '{{ $period->end_date?->format('Y-m-d') }}')"
                                                class="rounded-md border border-gray-300 px-3 py-1.5 text-xs font-medium text-gray-600 hover:bg-gray-50">
                                            Edit
                                        </button>
                                        <button @click="actionId = {{ $period->id }}; actionName = '{{ addslashes($period->name) }}'; showActivate = true"
                                                class="rounded-md bg-primary-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-primary-700">
                                            Aktifkan
                                        </button>
                                        <button @click="openDelete({{ $period->id }}, '{{ addslashes($period->name) }}')"
                                                class="rounded-md border border-red-300 px-3 py-1.5 text-xs font-medium text-red-600 hover:bg-red-50">
                                            Hapus
                                        </button>
                                    @elseif ($period->status === 'active')
                                        <button @click="openEdit({{ $period->id }}, '{{ $period->year }}', '{{ addslashes($period->name) }}', '{{ $period->start_date?->format('Y-m-d') }}', '{{ $period->end_date?->format('Y-m-d') }}')"
                                                class="rounded-md border border-gray-300 px-3 py-1.5 text-xs font-medium text-gray-600 hover:bg-gray-50">
                                            Edit
                                        </button>
                                        <button @click="actionId = {{ $period->id }}; actionName = '{{ addslashes($period->name) }}'; showComplete = true"
                                                class="rounded-md bg-accent-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-accent-700">
                                            Tutup Periode
                                        </button>
                                    @else
                                        <button @click="openDelete({{ $period->id }}, '{{ addslashes($period->name) }}')"
                                                class="rounded-md border border-red-300 px-3 py-1.5 text-xs font-medium text-red-600 hover:bg-red-50">
                                            Hapus
                                        </button>
                                    @endif
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6" class="px-4 py-10 text-center text-gray-400">
                                Belum ada periode assessment. Klik "Buat Periode" untuk memulai.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
            </div>
        </div>

        {{-- Modal Buat Periode --}}
        <div x-show="showCreate" x-transition.opacity class="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/50 px-4" style="display: none;" @keydown.escape.window="showCreate = false">
            <div @click.outside="showCreate = false" x-transition class="w-full max-w-lg rounded-xl bg-white p-6 shadow-xl">
                <h3 class="text-lg font-semibold text-gray-800">Buat Periode Assessment</h3>
                <form method="POST" action="{{ route('admin.periods.store') }}" class="mt-4 space-y-4">
                    @csrf
                    <div>
                        <x-input-label for="create_year" value="Tahun" />
                        <x-text-input id="create_year" name="year" type="number" class="mt-1 block w-full" :value="old('year', date('Y'))" required />
                        <x-input-error :messages="$errors->get('year')" class="mt-1" />
                    </div>
                    <div>
                        <x-input-label for="create_name" value="Nama Periode" />
                        <x-text-input id="create_name" name="name" type="text" class="mt-1 block w-full" :value="old('name')" placeholder="Assessment Maturitas Digital 2025" required />
                        <x-input-error :messages="$errors->get('name')" class="mt-1" />
                    </div>
                    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                        <div>
                            <x-input-label for="create_start" value="Tanggal Mulai" />
                            <x-text-input id="create_start" name="start_date" type="date" class="mt-1 block w-full" :value="old('start_date')" required />
                            <x-input-error :messages="$errors->get('start_date')" class="mt-1" />
                        </div>
                        <div>
                            <x-input-label for="create_end" value="Tanggal Selesai" />
                            <x-text-input id="create_end" name="end_date" type="date" class="mt-1 block w-full" :value="old('end_date')" required />
                            <x-input-error :messages="$errors->get('end_date')" class="mt-1" />
                        </div>
                    </div>
                    <div class="flex items-center justify-end gap-3 pt-2">
                        <button type="button" @click="showCreate = false" class="text-sm text-gray-500 hover:text-gray-700">Batal</button>
                        <x-primary-button>Simpan Periode</x-primary-button>
                    </div>
                </form>
            </div>
        </div>

        {{-- Modal Edit Periode --}}
        <div x-show="showEdit" x-transition.opacity class="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/50 px-4" style="display: none;" @keydown.escape.window="showEdit = false">
            <div @click.outside="showEdit = false" x-transition class="w-full max-w-lg rounded-xl bg-white p-6 shadow-xl">
                <h3 class="text-lg font-semibold text-gray-800">Edit Periode</h3>
                <form method="POST" :action="'{{ url('admin/periods') }}/' + editId" class="mt-4 space-y-4">
                    @csrf @method('PUT')
                    <div>
                        <x-input-label for="edit_year" value="Tahun" />
                        <x-text-input id="edit_year" name="year" type="number" class="mt-1 block w-full" x-model="editYear" required />
                    </div>
                    <div>
                        <x-input-label for="edit_name" value="Nama Periode" />
                        <x-text-input id="edit_name" name="name" type="text" class="mt-1 block w-full" x-model="editName" required />
                    </div>
                    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                        <div>
                            <x-input-label for="edit_start" value="Tanggal Mulai" />
                            <x-text-input id="edit_start" name="start_date" type="date" class="mt-1 block w-full" x-model="editStart" required />
                        </div>
                        <div>
                            <x-input-label for="edit_end" value="Tanggal Selesai" />
                            <x-text-input id="edit_end" name="end_date" type="date" class="mt-1 block w-full" x-model="editEnd" required />
                        </div>
                    </div>
                    <div class="flex items-center justify-end gap-3 pt-2">
                        <button type="button" @click="showEdit = false" class="text-sm text-gray-500 hover:text-gray-700">Batal</button>
                        <x-primary-button>Perbarui</x-primary-button>
                    </div>
                </form>
            </div>
        </div>

        {{-- Modal Aktifkan --}}
        <div x-show="showActivate" x-transition.opacity class="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/50 px-4" style="display: none;" @keydown.escape.window="showActivate = false">
            <div @click.outside="showActivate = false" x-transition class="w-full max-w-md rounded-xl bg-white p-6 shadow-xl">
                <h3 class="text-lg font-semibold text-gray-800">Aktifkan Periode</h3>
                <p class="mt-2 text-sm text-gray-600">Aktifkan periode <strong x-text="actionName"></strong>? Lembar assessment untuk 94 kontrol akan dibuat secara otomatis.</p>
                <form method="POST" :action="'{{ url('admin/periods') }}/' + actionId + '/activate'" class="mt-5">
                    @csrf @method('PATCH')
                    <div class="flex items-center justify-end gap-3">
                        <button type="button" @click="showActivate = false" class="text-sm text-gray-500 hover:text-gray-700">Batal</button>
                        <x-primary-button>Aktifkan</x-primary-button>
                    </div>
                </form>
            </div>
        </div>

        {{-- Modal Tutup Periode --}}
        <div x-show="showComplete" x-transition.opacity class="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/50 px-4" style="display: none;" @keydown.escape.window="showComplete = false">
            <div @click.outside="showComplete = false" x-transition class="w-full max-w-md rounded-xl bg-white p-6 shadow-xl">
                <h3 class="text-lg font-semibold text-gray-800">Tutup Periode</h3>
                <p class="mt-2 text-sm text-gray-600">Tutup periode <strong x-text="actionName"></strong>? Data akan menjadi histori dan tidak dapat diubah lagi.</p>
                <form method="POST" :action="'{{ url('admin/periods') }}/' + actionId + '/complete'" class="mt-5">
                    @csrf @method('PATCH')
                    <div class="flex items-center justify-end gap-3">
                        <button type="button" @click="showComplete = false" class="text-sm text-gray-500 hover:text-gray-700">Batal</button>
                        <button type="submit" class="rounded-md bg-accent-600 px-4 py-2 text-sm font-medium text-white hover:bg-accent-700">Tutup Periode</button>
                    </div>
                </form>
            </div>
        </div>

        {{-- Modal Hapus Periode --}}
        <div x-show="showDelete" x-transition.opacity class="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/50 px-4" style="display: none;" @keydown.escape.window="showDelete = false">
            <div @click.outside="showDelete = false" x-transition class="w-full max-w-md rounded-xl bg-white p-6 shadow-xl">
                <h3 class="text-lg font-semibold text-red-700">Hapus Periode</h3>
                <p class="mt-2 text-sm text-gray-600">Hapus periode <strong x-text="actionName"></strong>? Semua data assessment pada periode ini akan ikut terhapus. Tindakan ini tidak dapat dibatalkan.</p>
                <form method="POST" :action="'{{ url('admin/periods') }}/' + actionId" class="mt-5">
                    @csrf @method('DELETE')
                    <div class="flex items-center justify-end gap-3">
                        <button type="button" @click="showDelete = false" class="text-sm text-gray-500 hover:text-gray-700">Batal</button>
                        <button type="submit" class="rounded-md bg-red-600 px-4 py-2 text-sm font-medium text-white hover:bg-red-700">Hapus</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
