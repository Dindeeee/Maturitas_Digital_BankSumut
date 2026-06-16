<x-app-layout>
    <x-slot name="header">
        <h1 class="text-lg font-semibold text-gray-800">Pengisian Asesmen</h1>
    </x-slot>

    @if (! $period)
        <div class="rounded-xl border border-gray-200 bg-white p-10 text-center text-gray-500 shadow-sm">
            Belum ada periode asesmen yang aktif. Hubungi administrator.
        </div>
    @elseif ($controls->isEmpty())
        <div class="rounded-xl border border-gray-200 bg-white p-10 text-center text-gray-500 shadow-sm">
            Tidak ada kontrol yang ditugaskan ke divisi Anda
            @if (! auth()->user()->division_id) (akun Anda belum terhubung ke divisi). @endif
        </div>
    @else
        <div class="mb-4 rounded-lg bg-primary-50 px-4 py-3 text-sm text-primary-800">
            Periode aktif: <strong>{{ $period->name }}</strong> ({{ $period->year }}) · {{ $controls->count() }} kontrol untuk divisi Anda.
        </div>

        <div class="rounded-xl border border-gray-200 bg-white shadow-sm">
            <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 text-sm">
                <thead class="bg-gray-50 text-left text-xs uppercase tracking-wider text-gray-500">
                    <tr>
                        <th class="whitespace-nowrap px-4 py-3">Kontrol</th>
                        <th class="whitespace-nowrap px-4 py-3">Domain</th>
                        <th class="whitespace-nowrap px-4 py-3 w-48">Progress</th>
                        <th class="whitespace-nowrap px-4 py-3">Skor</th>
                        <th class="whitespace-nowrap px-4 py-3 text-right">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @foreach ($controls as $control)
                        @php
                            $m = $meta[$control->id];
                            $pct = $m['total'] ? round($m['filled'] / $m['total'] * 100) : 0;
                        @endphp
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-3">
                                <span class="font-semibold text-primary-700">{{ $control->code }}</span>
                                <span class="block text-gray-600">{{ \Illuminate\Support\Str::limit($control->title, 80) }}</span>
                            </td>
                            <td class="px-4 py-3 text-gray-500">{{ $control->subdomain->domain->name }}</td>
                            <td class="px-4 py-3">
                                <div class="flex items-center gap-2">
                                    <div class="h-2 flex-1 overflow-hidden rounded-full bg-gray-200">
                                        <div class="h-full rounded-full {{ $pct == 100 ? 'bg-primary-500' : 'bg-accent-500' }}" style="width: {{ $pct }}%"></div>
                                    </div>
                                    <span class="text-xs text-gray-500">{{ $m['filled'] }}/{{ $m['total'] }}</span>
                                </div>
                            </td>
                            <td class="px-4 py-3">
                                @if ($m['score'])
                                    <span class="font-medium text-gray-800">{{ $m['score']->percentage }}%</span>
                                    <span class="block text-xs text-gray-500">Nilai {{ $m['score']->nilai }} · {{ $m['score']->category }}</span>
                                @else
                                    <span class="text-xs text-gray-400">—</span>
                                @endif
                            </td>
                            <td class="px-4 py-3 text-right">
                                <a href="{{ route('assessment.show', $control) }}"
                                   class="rounded-md bg-primary-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-primary-700">
                                    {{ $m['filled'] ? 'Lanjutkan' : 'Isi' }}
                                </a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            </div>
        </div>
    @endif
</x-app-layout>
