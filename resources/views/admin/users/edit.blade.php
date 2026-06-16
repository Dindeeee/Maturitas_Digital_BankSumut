<x-app-layout>
    <x-slot name="header">
        <h1 class="text-lg font-semibold text-gray-800">Edit Pengguna</h1>
    </x-slot>

    <div class="max-w-2xl rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
        <form method="POST" action="{{ route('admin.users.update', $user) }}" class="space-y-5">
            @csrf @method('PUT')

            <div>
                <x-input-label for="name" value="Nama" />
                <x-text-input id="name" name="name" type="text" class="mt-1 block w-full" :value="old('name', $user->name)" required />
                <x-input-error :messages="$errors->get('name')" class="mt-1" />
            </div>

            <div>
                <x-input-label for="email" value="Email" />
                <x-text-input id="email" name="email" type="email" class="mt-1 block w-full" :value="old('email', $user->email)" required />
                <x-input-error :messages="$errors->get('email')" class="mt-1" />
            </div>

            <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                <div>
                    <x-input-label for="role" value="Role" />
                    <select id="role" name="role" required
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500">
                        @foreach ($roles as $r)
                            <option value="{{ $r }}" @selected(old('role', $user->role) === $r)>{{ ucfirst($r) }}</option>
                        @endforeach
                    </select>
                    <x-input-error :messages="$errors->get('role')" class="mt-1" />
                </div>
                <div>
                    <x-input-label for="division_id" value="Divisi (opsional)" />
                    <select id="division_id" name="division_id"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary-500 focus:ring-primary-500">
                        <option value="">— Tidak ada —</option>
                        @foreach ($divisions as $div)
                            <option value="{{ $div->id }}" @selected(old('division_id', $user->division_id) == $div->id)>{{ $div->code }} — {{ $div->name }}</option>
                        @endforeach
                    </select>
                    <x-input-error :messages="$errors->get('division_id')" class="mt-1" />
                </div>
            </div>

            <div class="rounded-lg bg-gray-50 p-4">
                <p class="mb-3 text-xs text-gray-500">Kosongkan password bila tidak ingin mengubahnya.</p>
                <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
                    <div>
                        <x-input-label for="password" value="Password Baru" />
                        <x-text-input id="password" name="password" type="password" class="mt-1 block w-full" />
                        <x-input-error :messages="$errors->get('password')" class="mt-1" />
                    </div>
                    <div>
                        <x-input-label for="password_confirmation" value="Konfirmasi Password" />
                        <x-text-input id="password_confirmation" name="password_confirmation" type="password" class="mt-1 block w-full" />
                    </div>
                </div>
            </div>

            <div class="flex items-center gap-3 pt-2">
                <x-primary-button>Perbarui</x-primary-button>
                <a href="{{ route('admin.users.index') }}" class="text-sm text-gray-500 hover:text-gray-700">Batal</a>
            </div>
        </form>
    </div>
</x-app-layout>
