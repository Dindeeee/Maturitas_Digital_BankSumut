<x-app-layout>
    <x-slot name="header">
        <h1 class="text-lg font-semibold text-gray-800">Kelola Divisi</h1>
    </x-slot>

    <div x-data="{
        showCreate: false,
        showEdit: false,
        showDelete: false,
        editId: null,
        editCode: '',
        editName: '',
        deleteId: null,
        deleteName: '',
        openEdit(id, code, name) {
            this.editId = id;
            this.editCode = code;
            this.editName = name;
            this.showEdit = true;
        },
        openDelete(id, name) {
            this.deleteId = id;
            this.deleteName = name;
            this.showDelete = true;
        },
    }">
        <div class="mb-4 flex justify-end">
            <button @click="showCreate = true"
                    class="inline-flex items-center gap-2 rounded-lg bg-primary-600 px-4 py-2 text-sm font-medium text-white hover:bg-primary-700">
                + Tambah Divisi
            </button>
        </div>

        <div class="rounded-xl border border-gray-200 bg-white shadow-sm">
            <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 text-sm">
                <thead class="bg-gray-50 text-left text-xs uppercase tracking-wider text-gray-500">
                    <tr>
                        <th class="whitespace-nowrap px-4 py-3">Kode</th>
                        <th class="whitespace-nowrap px-4 py-3">Nama Divisi</th>
                        <th class="whitespace-nowrap px-4 py-3 text-center">Pengguna</th>
                        <th class="whitespace-nowrap px-4 py-3 text-center">Kontrol PIC</th>
                        <th class="whitespace-nowrap px-4 py-3 text-right">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @forelse ($divisions as $division)
                        <tr class="hover:bg-gray-50">
                            <td class="whitespace-nowrap px-4 py-3 font-semibold text-primary-700">{{ $division->code }}</td>
                            <td class="px-4 py-3 text-gray-800">{{ $division->name }}</td>
                            <td class="px-4 py-3 text-center text-gray-600">{{ $division->users_count }}</td>
                            <td class="px-4 py-3 text-center text-gray-600">{{ $division->controls_count }}</td>
                            <td class="px-4 py-3">
                                <div class="flex justify-end gap-2">
                                    <button @click="openEdit({{ $division->id }}, '{{ addslashes($division->code) }}', '{{ addslashes($division->name) }}')"
                                            class="rounded-md border border-gray-300 px-3 py-1.5 text-xs text-gray-600 hover:bg-gray-50">Edit</button>
                                    <button @click="openDelete({{ $division->id }}, '{{ addslashes($division->code) }}')"
                                            class="rounded-md border border-red-200 px-3 py-1.5 text-xs text-red-600 hover:bg-red-50">Hapus</button>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5" class="px-4 py-10 text-center text-gray-400">
                                Belum ada divisi. Klik "Tambah Divisi" untuk memulai.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
            </div>
        </div>

        {{-- Modal Tambah --}}
        <div x-show="showCreate" x-transition.opacity class="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/50 px-4" style="display: none;" @keydown.escape.window="showCreate = false">
            <div @click.outside="showCreate = false" x-transition class="w-full max-w-md rounded-xl bg-white p-6 shadow-xl">
                <h3 class="text-lg font-semibold text-gray-800">Tambah Divisi</h3>
                <form method="POST" action="{{ route('admin.divisions.store') }}" class="mt-4 space-y-4">
                    @csrf
                    <div>
                        <x-input-label for="create_code" value="Kode Divisi" />
                        <x-text-input id="create_code" name="code" type="text" class="mt-1 block w-full" required placeholder="Contoh: DIV-IT" />
                        <x-input-error :messages="$errors->get('code')" class="mt-1" />
                    </div>
                    <div>
                        <x-input-label for="create_name" value="Nama Divisi" />
                        <x-text-input id="create_name" name="name" type="text" class="mt-1 block w-full" required placeholder="Contoh: Divisi Teknologi Informasi" />
                        <x-input-error :messages="$errors->get('name')" class="mt-1" />
                    </div>
                    <div class="flex items-center justify-end gap-3 pt-2">
                        <button type="button" @click="showCreate = false" class="text-sm text-gray-500 hover:text-gray-700">Batal</button>
                        <x-primary-button>Simpan</x-primary-button>
                    </div>
                </form>
            </div>
        </div>

        {{-- Modal Edit --}}
        <div x-show="showEdit" x-transition.opacity class="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/50 px-4" style="display: none;" @keydown.escape.window="showEdit = false">
            <div @click.outside="showEdit = false" x-transition class="w-full max-w-md rounded-xl bg-white p-6 shadow-xl">
                <h3 class="text-lg font-semibold text-gray-800">Edit Divisi</h3>
                <form method="POST" :action="'{{ route('admin.divisions.index') }}/' + editId" class="mt-4 space-y-4">
                    @csrf @method('PUT')
                    <div>
                        <x-input-label for="edit_code" value="Kode Divisi" />
                        <x-text-input id="edit_code" name="code" type="text" class="mt-1 block w-full" required x-model="editCode" />
                    </div>
                    <div>
                        <x-input-label for="edit_name" value="Nama Divisi" />
                        <x-text-input id="edit_name" name="name" type="text" class="mt-1 block w-full" required x-model="editName" />
                    </div>
                    <div class="flex items-center justify-end gap-3 pt-2">
                        <button type="button" @click="showEdit = false" class="text-sm text-gray-500 hover:text-gray-700">Batal</button>
                        <x-primary-button>Simpan Perubahan</x-primary-button>
                    </div>
                </form>
            </div>
        </div>

        {{-- Modal Hapus --}}
        <div x-show="showDelete" x-transition.opacity class="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/50 px-4" style="display: none;" @keydown.escape.window="showDelete = false">
            <div @click.outside="showDelete = false" x-transition class="w-full max-w-md rounded-xl bg-white p-6 shadow-xl">
                <h3 class="text-lg font-semibold text-gray-800">Hapus Divisi</h3>
                <p class="mt-2 text-sm text-gray-600">Yakin ingin menghapus divisi <strong x-text="deleteName"></strong>? Tindakan ini tidak dapat dibatalkan.</p>
                <form method="POST" :action="'{{ route('admin.divisions.index') }}/' + deleteId" class="mt-5">
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
