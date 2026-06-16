<x-app-layout>
    <x-slot name="header">
        <h1 class="text-lg font-semibold text-gray-800">Master Data & Penugasan PIC</h1>
    </x-slot>

    <p class="mb-4 text-sm text-gray-500">
        8 Domain · 14 Sub-domain · 94 Kontrol · 336 Sub-kontrol. Klik domain untuk melihat kontrol dan menetapkan divisi PIC.
    </p>

    <div class="space-y-3">
        @foreach ($domains as $domain)
            <div x-data="{ open: false }" class="rounded-xl border border-gray-200 bg-white shadow-sm">
                <button @click="open = !open"
                        class="flex w-full items-center justify-between px-5 py-4 text-left hover:bg-gray-50">
                    <span class="font-semibold text-gray-800">
                        <span class="text-primary-600">{{ $domain->code }}.</span> {{ $domain->name }}
                    </span>
                    <svg class="h-5 w-5 text-gray-400 transition-transform" :class="open && 'rotate-180'"
                         fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                    </svg>
                </button>

                <div x-show="open" x-transition style="display:none;" class="border-t border-gray-100">
                    @foreach ($domain->subdomains as $subdomain)
                        <div class="px-5 py-3">
                            <p class="mb-2 text-sm font-medium text-gray-500">
                                {{ $subdomain->code }} — {{ $subdomain->name }}
                            </p>

                            <div class="space-y-2">
                                @foreach ($subdomain->controls as $control)
                                    <div x-data="{ edit: false }" class="rounded-lg border border-gray-100 bg-gray-50 p-3">
                                        <div class="flex items-start justify-between gap-3">
                                            <div class="min-w-0">
                                                <p class="text-sm text-gray-800">
                                                    <span class="font-semibold text-primary-700">{{ $control->code }}</span>
                                                    — {{ \Illuminate\Support\Str::limit($control->title, 110) }}
                                                </p>
                                                <div class="mt-1 flex flex-wrap items-center gap-1">
                                                    <span class="text-xs text-gray-400">{{ $control->sub_controls_count }} sub-kontrol ·</span>
                                                    @forelse ($control->divisions as $div)
                                                        <span class="rounded bg-accent-100 px-1.5 py-0.5 text-xs text-accent-700">{{ $div->code }}</span>
                                                    @empty
                                                        <span class="text-xs italic text-gray-400">belum ada PIC</span>
                                                    @endforelse
                                                </div>
                                            </div>
                                            <button @click="edit = !edit"
                                                    class="shrink-0 rounded-md border border-gray-300 px-2.5 py-1 text-xs text-gray-600 hover:bg-white">
                                                Atur PIC
                                            </button>
                                        </div>

                                        <form x-show="edit" x-transition style="display:none;" method="POST"
                                              action="{{ route('admin.master-data.pic', $control) }}" class="mt-3 border-t border-gray-200 pt-3">
                                            @csrf @method('PUT')
                                            <div class="flex flex-wrap gap-3">
                                                @foreach ($divisions as $div)
                                                    <label class="inline-flex items-center gap-1.5 text-xs text-gray-700">
                                                        <input type="checkbox" name="divisions[]" value="{{ $div->id }}"
                                                               @checked($control->divisions->contains($div->id))
                                                               class="rounded border-gray-300 text-primary-600 focus:ring-primary-500">
                                                        {{ $div->code }}
                                                    </label>
                                                @endforeach
                                            </div>
                                            <div class="mt-3">
                                                <button class="rounded-md bg-primary-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-primary-700">
                                                    Simpan PIC
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        @endforeach
    </div>
</x-app-layout>
