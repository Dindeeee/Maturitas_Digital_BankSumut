<x-app-layout>
    <x-slot name="header">
        <h1 class="text-lg font-semibold text-gray-800">Kelola Pengguna</h1>
    </x-slot>

    <div x-data="{
        showCreate: false,
        showEdit: false,
        showDelete: false,
        editId: null,
        editName: '',
        editEmail: '',
        editRole: '',
        editDivision: '',
        deleteId: null,
        deleteName: '',
        openEdit(id, name, email, role, divisionId) {
            this.editId = id;
            this.editName = name;
            this.editEmail = email;
            this.editRole = role;
            this.editDivision = divisionId || '';
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
                + Tambah Pengguna
            </button>
        </div>

        <div class="rounded-xl border border-gray-200 bg-white shadow-sm">
            <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 text-sm">
                <thead class="bg-gray-50 text-left text-xs uppercase tracking-wider text-gray-500">
                    <tr>
                        <th class="whitespace-nowrap px-4 py-3">Nama</th>
                        <th class="whitespace-nowrap px-4 py-3">Email</th>
                        <th class="whitespace-nowrap px-4 py-3">Role</th>
                        <th class="whitespace-nowrap px-4 py-3">Divisi</th>
                        <th class="whitespace-nowrap px-4 py-3 text-right">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @foreach ($users as $user)
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-3 font-medium text-gray-800">{{ $user->name }}</td>
                            <td class="px-4 py-3 text-gray-600">{{ $user->email }}</td>
                            <td class="px-4 py-3">
                                <span class="rounded-full bg-primary-50 px-2.5 py-0.5 text-xs font-medium capitalize text-primary-700">
                                    {{ $user->role }}
                                </span>
                            </td>
                            <td class="px-4 py-3 text-gray-600">{{ $user->division?->code ?? '—' }}</td>
                            <td class="px-4 py-3">
                                <div class="flex justify-end gap-2">
                                    <button @click="openEdit({{ $user->id }}, '{{ addslashes($user->name) }}', '{{ addslashes($user->email) }}', '{{ $user->role }}', '{{ $user->division_id }}')"
                                            class="rounded-md border border-gray-300 px-3 py-1.5 text-xs text-gray-600 hover:bg-gray-50">Edit</button>
                                    <button @click="openDelete({{ $user->id }}, '{{ addslashes($user->name) }}')"
                                            class="rounded-md border border-red-200 px-3 py-1.5 text-xs text-red-600 hover:bg-red-50">Hapus</button>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            </div>
        </div>

        {{-- Modal Tambah Pengguna --}}
        <div x-show="showCreate" x-transition.opacity class="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/50 px-4" style="display: none;" @keydown.escape.window="showCreate = false">
            <div @click.outside="showCreate = false" x-transition class="w-full max-w-lg rounded-xl bg-white p-6 shadow-xl max-h-[90vh] overflow-y-auto">
                <h3 class="text-lg font-semibold text-gray-800">Tambah Pengguna</h3>
                <form method="POST" action="{{ route('admin.users.store') }}" class="mt-4 space-y-4">
                    @csrf
                    <div>
                        <x-input-label for="c_name" value="Nama" />
                        <x-text-input id="c_name" name="name" type="text" class="mt-1 block w-full" :value="old('name')" required />
                        <x-input-error :messages="$errors->get('name')" class="mt-1" />
                    </div>
                    <div>
                        <x-input-label for="c_email" value="Email" />
                        <x-text-input id="c_email" name="email" type="email" class="mt-1 block w-full" :value="old('email')" required />
                        <x-input-error :messages="$errors->get('email')" class="mt-1" />
                    </div>
                    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                        <div>
                            <x-input-label for="c_role" value="Role" />
                            <select id="c_role" name="role" required
                                    class="mt-1 block w-full rounded-lg border-gray-300 text-sm shadow-sm focus:border-accent-500 focus:ring-accent-500">
                                @foreach ($roles as $r)
                                    <option value="{{ $r }}" @selected(old('role') === $r)>{{ ucfirst($r) }}</option>
                                @endforeach
                            </select>
                            <x-input-error :messages="$errors->get('role')" class="mt-1" />
                        </div>
                        <div>
                            <x-input-label for="c_division" value="Divisi (opsional)" />
                            <select id="c_division" name="division_id"
                                    class="mt-1 block w-full rounded-lg border-gray-300 text-sm shadow-sm focus:border-accent-500 focus:ring-accent-500">
                                <option value="">— Tidak ada —</option>
                                @foreach ($divisions as $div)
                                    <option value="{{ $div->id }}" @selected(old('division_id') == $div->id)>{{ $div->code }} — {{ $div->name }}</option>
                                @endforeach
                            </select>
                            <x-input-error :messages="$errors->get('division_id')" class="mt-1" />
                        </div>
                    </div>
                    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                        <div>
                            <x-input-label for="c_password" value="Password" />
                            <x-text-input id="c_password" name="password" type="password" class="mt-1 block w-full" required />
                            <x-input-error :messages="$errors->get('password')" class="mt-1" />
                        </div>
                        <div>
                            <x-input-label for="c_password_confirm" value="Konfirmasi Password" />
                            <x-text-input id="c_password_confirm" name="password_confirmation" type="password" class="mt-1 block w-full" required />
                        </div>
                    </div>
                    <div class="flex items-center justify-end gap-3 pt-2">
                        <button type="button" @click="showCreate = false" class="text-sm text-gray-500 hover:text-gray-700">Batal</button>
                        <x-primary-button>Simpan</x-primary-button>
                    </div>
                </form>
            </div>
        </div>

        {{-- Modal Edit Pengguna --}}
        <div x-show="showEdit" x-transition.opacity class="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/50 px-4" style="display: none;" @keydown.escape.window="showEdit = false">
            <div @click.outside="showEdit = false" x-transition class="w-full max-w-lg rounded-xl bg-white p-6 shadow-xl max-h-[90vh] overflow-y-auto">
                <h3 class="text-lg font-semibold text-gray-800">Edit Pengguna</h3>
                <form method="POST" :action="'{{ route('admin.users.index') }}/' + editId" class="mt-4 space-y-4">
                    @csrf @method('PUT')
                    <div>
                        <x-input-label for="e_name" value="Nama" />
                        <x-text-input id="e_name" name="name" type="text" class="mt-1 block w-full" required x-model="editName" />
                    </div>
                    <div>
                        <x-input-label for="e_email" value="Email" />
                        <x-text-input id="e_email" name="email" type="email" class="mt-1 block w-full" required x-model="editEmail" />
                    </div>
                    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                        <div>
                            <x-input-label for="e_role" value="Role" />
                            <select id="e_role" name="role" required x-model="editRole"
                                    class="mt-1 block w-full rounded-lg border-gray-300 text-sm shadow-sm focus:border-accent-500 focus:ring-accent-500">
                                @foreach ($roles as $r)
                                    <option value="{{ $r }}">{{ ucfirst($r) }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div>
                            <x-input-label for="e_division" value="Divisi (opsional)" />
                            <select id="e_division" name="division_id" x-model="editDivision"
                                    class="mt-1 block w-full rounded-lg border-gray-300 text-sm shadow-sm focus:border-accent-500 focus:ring-accent-500">
                                <option value="">— Tidak ada —</option>
                                @foreach ($divisions as $div)
                                    <option value="{{ $div->id }}">{{ $div->code }} — {{ $div->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="rounded-lg bg-gray-50 p-4">
                        <p class="mb-3 text-xs text-gray-500">Kosongkan password bila tidak ingin mengubahnya.</p>
                        <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                            <div>
                                <x-input-label for="e_password" value="Password Baru" />
                                <x-text-input id="e_password" name="password" type="password" class="mt-1 block w-full" />
                            </div>
                            <div>
                                <x-input-label for="e_password_confirm" value="Konfirmasi Password" />
                                <x-text-input id="e_password_confirm" name="password_confirmation" type="password" class="mt-1 block w-full" />
                            </div>
                        </div>
                    </div>
                    <div class="flex items-center justify-end gap-3 pt-2">
                        <button type="button" @click="showEdit = false" class="text-sm text-gray-500 hover:text-gray-700">Batal</button>
                        <x-primary-button>Perbarui</x-primary-button>
                    </div>
                </form>
            </div>
        </div>

        {{-- Modal Hapus Pengguna --}}
        <div x-show="showDelete" x-transition.opacity class="fixed inset-0 z-50 flex items-center justify-center bg-gray-900/50 px-4" style="display: none;" @keydown.escape.window="showDelete = false">
            <div @click.outside="showDelete = false" x-transition class="w-full max-w-md rounded-xl bg-white p-6 shadow-xl">
                <h3 class="text-lg font-semibold text-gray-800">Hapus Pengguna</h3>
                <p class="mt-2 text-sm text-gray-600">Yakin ingin menghapus pengguna <strong x-text="deleteName"></strong>? Tindakan ini tidak dapat dibatalkan.</p>
                <form method="POST" :action="'{{ route('admin.users.index') }}/' + deleteId" class="mt-5">
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
