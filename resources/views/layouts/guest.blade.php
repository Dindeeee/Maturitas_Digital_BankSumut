<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Favicon -->
        <link rel="icon" href="{{ asset('favicon.ico') }}" sizes="any">
        <link rel="icon" type="image/png" href="{{ asset('storage/images/icon_bank_sumut.png') }}">
        <link rel="apple-touch-icon" href="{{ asset('storage/images/icon_bank_sumut.png') }}">

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <body class="font-sans text-gray-900 antialiased">
        <div class="min-h-screen flex">
            <!-- Panel kiri: branding -->
            <div class="hidden lg:flex lg:w-1/2 flex-col justify-between bg-gradient-to-br from-accent-700 via-accent-800 to-accent-900 p-12 text-white">
                <div>
                    <a href="/" class="inline-block rounded-xl bg-white px-5 py-3 shadow-lg">
                        <x-application-logo class="h-10 w-auto" />
                    </a>
                </div>
                <div>
                    <h1 class="text-3xl font-bold leading-tight">Assessment Maturitas<br>Digital Bank Sumut</h1>
                    <p class="mt-4 text-accent-200 text-sm leading-relaxed max-w-md">
                        Sistem digitalisasi kertas kerja assessment maturitas digital berdasarkan
                        SEOJK No. 24/SEOJK.03/2023.
                    </p>
                </div>
                <p class="text-xs text-accent-300">&copy; {{ date('Y') }} PT Bank Sumut. All rights reserved.</p>
            </div>

            <!-- Panel kanan: form -->
            <div class="flex w-full lg:w-1/2 flex-col items-center justify-center bg-gray-50 px-6 py-12">
                <!-- Logo (mobile only) -->
                <div class="mb-8 flex flex-col items-center lg:hidden">
                    <a href="/" class="inline-block rounded-xl bg-white px-5 py-3 shadow-md border border-gray-100">
                        <x-application-logo class="h-9 w-auto" />
                    </a>
                    <p class="mt-3 text-sm font-medium text-gray-500">Assessment Maturitas Digital</p>
                </div>

                <div class="w-full sm:max-w-md rounded-2xl bg-white px-8 py-8 shadow-sm border border-gray-200">
                    {{ $slot }}
                </div>
            </div>
        </div>
    </body>
</html>
