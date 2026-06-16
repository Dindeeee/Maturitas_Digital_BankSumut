@props([
    'label' => '',
    'value' => '',
    'icon' => 'grid',
    'tone' => 'primary', // primary | accent
])

@php
    $toneClasses = $tone === 'accent'
        ? 'bg-accent-50 text-accent-600'
        : 'bg-primary-50 text-primary-600';

    $paths = [
        'grid'      => 'M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z',
        'clipboard' => 'M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2',
        'check'     => 'M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z',
        'chart'     => 'M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z',
    ];
    $d = $paths[$icon] ?? $paths['grid'];
@endphp

<div class="flex items-center gap-4 rounded-xl border border-gray-200 bg-white p-5 shadow-sm">
    <div class="flex h-12 w-12 shrink-0 items-center justify-center rounded-lg {{ $toneClasses }}">
        <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8" d="{{ $d }}" />
        </svg>
    </div>
    <div>
        <p class="text-2xl font-semibold text-gray-800">{{ $value }}</p>
        <p class="text-sm text-gray-500">{{ $label }}</p>
    </div>
</div>
