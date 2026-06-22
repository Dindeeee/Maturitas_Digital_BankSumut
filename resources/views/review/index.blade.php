<x-app-layout>
    <x-slot name="header">
        <h1 class="text-lg font-semibold text-gray-800">Review Assessment</h1>
    </x-slot>

    @if (! $period)
        <div class="rounded-xl border border-gray-200 bg-white p-10 text-center text-gray-500 shadow-sm">
            Belum ada periode assessment{{ !in_array(auth()->user()->role, ['reviewer']) ? '' : ' yang aktif' }}.
        </div>
    @else
        <div class="mb-4 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
            <div class="flex flex-col gap-2 sm:flex-row sm:items-center">
                @if (!in_array(auth()->user()->role, ['reviewer']) && $periods->count() > 1)
                    <form method="GET" class="flex items-center gap-2">
                        @if ($domainId)<input type="hidden" name="domain_id" value="{{ $domainId }}">@endif
                        <select name="period" onchange="this.form.submit()"
                                class="rounded-md border-gray-300 text-sm shadow-sm focus:border-primary-500 focus:ring-primary-500">
                            @foreach ($periods as $p)
                                <option value="{{ $p->id }}" @selected($period->id == $p->id)>
                                    {{ $p->name }} ({{ $p->year }}) — {{ $p->status === 'active' ? 'Aktif' : 'Selesai' }}
                                </option>
                            @endforeach
                        </select>
                    </form>
                @else
                    <div class="rounded-lg bg-primary-50 px-4 py-2 text-sm text-primary-800">
                        Periode: <strong>{{ $period->name }}</strong> ({{ $period->year }})
                    </div>
                @endif
                @if ($period->status === 'completed')
                    <span class="inline-flex items-center rounded-full bg-gray-100 px-2.5 py-0.5 text-xs font-medium text-gray-600">Selesai</span>
                @endif
            </div>
            <form method="GET" class="flex items-center gap-2">
                @if (!in_array(auth()->user()->role, ['reviewer']) && $period)<input type="hidden" name="period" value="{{ $period->id }}">@endif
                <select name="domain_id" onchange="this.form.submit()"
                        class="rounded-md border-gray-300 text-sm shadow-sm focus:border-primary-500 focus:ring-primary-500">
                    <option value="">Semua Domain</option>
                    @foreach ($domains as $d)
                        <option value="{{ $d->id }}" @selected($domainId == $d->id)>{{ $d->code }}. {{ $d->name }}</option>
                    @endforeach
                </select>
            </form>
        </div>

        <div class="rounded-xl border border-gray-200 bg-white shadow-sm">
            <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200 text-sm">
                <thead class="bg-gray-50 text-left text-xs uppercase tracking-wider text-gray-500">
                    <tr>
                        <th class="whitespace-nowrap px-4 py-3">Kontrol</th>
                        <th class="whitespace-nowrap px-4 py-3">Domain</th>
                        <th class="whitespace-nowrap px-4 py-3 text-center">Terisi</th>
                        <th class="whitespace-nowrap px-4 py-3">Skor</th>
                        <th class="whitespace-nowrap px-4 py-3">Review</th>
                        <th class="whitespace-nowrap px-4 py-3">Approval</th>
                        <th class="whitespace-nowrap px-4 py-3 text-right">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @forelse ($results as $r)
                        @php $score = $scores[$r->control_id] ?? null; @endphp
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-3">
                                <span class="font-semibold text-primary-700">{{ $r->control->code }}</span>
                                <span class="block text-gray-600">{{ \Illuminate\Support\Str::limit($r->control->title, 70) }}</span>
                            </td>
                            <td class="px-4 py-3 text-gray-500">{{ $r->control->subdomain->domain->name }}</td>
                            <td class="px-4 py-3 text-center text-gray-600">{{ $r->filled_count }}</td>
                            <td class="px-4 py-3">
                                @if ($score)
                                    <span class="font-medium text-gray-800">{{ $score->percentage }}%</span>
                                    <span class="block text-xs text-gray-500">Nilai {{ $score->nilai }}</span>
                                @else
                                    <span class="text-xs text-gray-400">—</span>
                                @endif
                            </td>
                            <td class="px-4 py-3"><x-status-badge :status="$r->review_progress" /></td>
                            <td class="px-4 py-3">
                                @if ($r->approval_status === 'approved')
                                    <span class="inline-flex rounded-full bg-green-100 px-2.5 py-0.5 text-xs font-medium text-green-700">Disetujui</span>
                                @elseif ($r->approval_status === 'rejected')
                                    <span class="inline-flex rounded-full bg-red-100 px-2.5 py-0.5 text-xs font-medium text-red-700">Ditolak</span>
                                @else
                                    <span class="text-xs text-gray-400">—</span>
                                @endif
                            </td>
                            <td class="px-4 py-3 text-right">
                                <a href="{{ route('review.show', array_filter(['control' => $r->control_id, 'period' => !in_array(auth()->user()->role, ['reviewer']) ? $period->id : null, 'domain_id' => $domainId])) }}"
                                   class="rounded-md border border-gray-300 px-3 py-1.5 text-xs text-gray-600 hover:bg-gray-50">{{ auth()->user()->role === 'reviewer' ? 'Tinjau' : 'Lihat' }}</a>
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="7" class="px-4 py-10 text-center text-gray-400">Tidak ada kontrol.</td></tr>
                    @endforelse
                </tbody>
            </table>
            </div>
        </div>
    @endif
</x-app-layout>
