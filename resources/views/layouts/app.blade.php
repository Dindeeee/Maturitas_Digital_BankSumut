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
    <body class="font-sans antialiased">
        <div x-data="{ sidebarOpen: false }" class="min-h-screen bg-gray-50">

            <!-- Overlay (mobile) -->
            <div x-show="sidebarOpen"
                 x-transition.opacity
                 @click="sidebarOpen = false"
                 class="fixed inset-0 z-30 bg-gray-900/50 lg:hidden"
                 style="display: none;"></div>

            <!-- Sidebar -->
            <aside class="fixed inset-y-0 left-0 z-40 w-64 transform bg-primary-700 text-primary-50 transition-transform duration-200 lg:translate-x-0"
                   :class="sidebarOpen ? 'translate-x-0' : '-translate-x-full'">

                <!-- Brand -->
                <div class="flex h-16 items-center gap-3 border-b border-primary-600/60 px-5">
                    <div class="flex shrink-0 items-center rounded-lg">
                        <x-application-logo class="h-10 w-auto" />
                    </div>
                    <div class="leading-tight">
                        <div class="text-sm font-semibold text-white">Bank Sumut</div>
                        <div class="text-[11px] text-primary-100">Assessment Maturitas Digital</div>
                    </div>
                </div>

                <!-- Navigation -->
                <nav class="flex flex-col gap-1 px-3 py-4 text-sm">
                    @php
                        $role = auth()->user()->role ?? 'approval';
                        $link = fn ($name) => \Illuminate\Support\Facades\Route::has($name) ? route($name) : '#';
                    @endphp

                    <x-sidebar-link :href="route('dashboard')" :active="request()->routeIs('dashboard')" icon="home">
                        Dashboard
                    </x-sidebar-link>

                    @if ($role === 'admin')
                        <p class="px-3 pt-4 pb-1 text-[11px] font-semibold uppercase tracking-wider text-primary-200/70">Administrasi</p>
                        <x-sidebar-link :href="$link('admin.periods.index')" :active="request()->routeIs('admin.periods.*')" icon="calendar">
                            Periode Assessment
                        </x-sidebar-link>
                        <x-sidebar-link :href="$link('admin.master-data.index')" :active="request()->routeIs('admin.master-data.*')" icon="grid">
                            Master Data
                        </x-sidebar-link>
                        <x-sidebar-link :href="$link('admin.users.index')" :active="request()->routeIs('admin.users.*')" icon="users">
                            Kelola Pengguna
                        </x-sidebar-link>
                        <x-sidebar-link :href="$link('admin.divisions.index')" :active="request()->routeIs('admin.divisions.*')" icon="building">
                            Kelola Divisi
                        </x-sidebar-link>
                    @endif

                    @if (in_array($role, ['admin', 'reviewer', 'approval'], true))
                        <p class="px-3 pt-4 pb-1 text-[11px] font-semibold uppercase tracking-wider text-primary-200/70">Laporan</p>
                        <x-sidebar-link :href="$link('reports.index')" :active="request()->routeIs('reports.*')" icon="download">
                            Export Laporan
                        </x-sidebar-link>
                    @endif

                    @if ($role === 'assessor')
                        <p class="px-3 pt-4 pb-1 text-[11px] font-semibold uppercase tracking-wider text-primary-200/70">Assessment</p>
                        <x-sidebar-link :href="$link('assessment.index')" :active="request()->routeIs('assessment.*')" icon="clipboard">
                            Pengisian Assessment
                        </x-sidebar-link>
                    @endif

                    @if (in_array($role, ['admin', 'reviewer', 'approval'], true))
                        <p class="px-3 pt-4 pb-1 text-[11px] font-semibold uppercase tracking-wider text-primary-200/70">Review</p>
                        <x-sidebar-link :href="$link('review.index')" :active="request()->routeIs('review.*')" icon="check">
                            {{ $role === 'reviewer' ? 'Review Assessment' : ($role === 'approval' ? 'Approval Assessment' : 'Lihat Review') }}
                        </x-sidebar-link>
                    @endif

                    <p class="px-3 pt-4 pb-1 text-[11px] font-semibold uppercase tracking-wider text-primary-200/70">Akun</p>
                    <x-sidebar-link :href="route('profile.edit')" :active="request()->routeIs('profile.*')" icon="user">
                        Profil
                    </x-sidebar-link>
                </nav>
            </aside>

            <!-- Main column -->
            <div class="lg:pl-64">
                <!-- Topbar -->
                <header class="sticky top-0 z-20 flex h-16 items-center gap-4 border-b border-gray-200 bg-white px-4 shadow-sm sm:px-6">
                    <!-- Hamburger (mobile) -->
                    <button @click="sidebarOpen = true" class="text-gray-500 hover:text-gray-700 lg:hidden">
                        <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                        </svg>
                    </button>

                    <!-- Page title -->
                    <div class="flex-1">
                        @isset($header)
                            {{ $header }}
                        @endisset
                    </div>

                    <!-- User dropdown -->
                    <div x-data="{ open: false }" class="relative">
                        <button @click="open = !open" class="flex items-center gap-2 rounded-full py-1 pl-1 pr-3 hover:bg-gray-100">
                            <span class="flex h-8 w-8 items-center justify-center rounded-full bg-primary-100 text-sm font-semibold text-primary-700">
                                {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
                            </span>
                            <span class="hidden text-left sm:block">
                                <span class="block text-sm font-medium text-gray-800">{{ auth()->user()->name }}</span>
                                <span class="block text-[11px] capitalize text-accent-600">{{ auth()->user()->role ?? 'approval' }}</span>
                            </span>
                            <svg class="h-4 w-4 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                            </svg>
                        </button>

                        <div x-show="open"
                             @click.outside="open = false"
                             x-transition
                             class="absolute right-0 mt-2 w-48 rounded-lg border border-gray-100 bg-white py-1 shadow-lg"
                             style="display: none;">
                            <a href="{{ route('profile.edit') }}" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-50">Profil</a>
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <button type="submit" class="block w-full px-4 py-2 text-left text-sm text-gray-700 hover:bg-gray-50">Keluar</button>
                            </form>
                        </div>
                    </div>
                </header>

                <!-- Page Content -->
                <main class="p-4 sm:p-6">
                    @if (session('success'))
                        <div class="mb-4 rounded-lg border border-primary-200 bg-primary-50 px-4 py-3 text-sm text-primary-800">
                            {{ session('success') }}
                        </div>
                    @endif
                    @if (session('error'))
                        <div class="mb-4 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-800">
                            {{ session('error') }}
                        </div>
                    @endif

                    {{ $slot }}
                </main>
            </div>
        </div>
    </body>
</html>
