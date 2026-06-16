@props(['status' => ''])

@php
    $map = [
        // Periode
        'draft'       => ['Draft', 'bg-gray-100 text-gray-700'],
        'active'      => ['Aktif', 'bg-primary-100 text-primary-700'],
        'submitted'   => ['Diajukan', 'bg-accent-100 text-accent-700'],
        'completed'   => ['Selesai', 'bg-blue-100 text-blue-700'],
        // Review progress
        'pending'     => ['Pending', 'bg-gray-100 text-gray-600'],
        'in_progress' => ['Diproses', 'bg-accent-100 text-accent-700'],
        'done'        => ['Selesai', 'bg-primary-100 text-primary-700'],
    ];
    [$label, $classes] = $map[$status] ?? [ucfirst($status), 'bg-gray-100 text-gray-700'];
@endphp

<span class="inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium {{ $classes }}">
    {{ $label }}
</span>
