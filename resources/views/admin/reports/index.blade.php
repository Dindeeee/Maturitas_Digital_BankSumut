<x-app-layout>
    <x-slot name="header">
        <h2 class="h4 font-weight-bold text-dark">
            {{ __('Export Laporan') }}
        </h2>
        <p class="text-muted small">Unduh hasil assessment maturitas digital dalam format Excel atau PDF</p>
    </x-slot>

    <div class="py-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    
                    <div class="card border-0 shadow-sm rounded-3 p-4">
                        
                        <div class="mb-4">
                            <label class="form-label fw-bold small text-muted">Pilih Periode Assessment</label>
                            <form method="GET" id="exportForm">
                                <select name="period" onchange="this.form.submit()" class="form-select form-select-lg border-secondary-subtle">
                                    @foreach ($periods as $p)
                                        <option value="{{ $p->id }}" @selected($period && $period->id == $p->id)>
                                            {{ $p->name }} — {{ $p->year }} {{ $period && $period->id == $p->id ? '(Aktif)' : '' }}
                                        </option>
                                    @endforeach
                                </select>
                            </form>
                        </div>

                        @if ($period)
                        <div class="card border border-light-subtle bg-light bg-opacity-50 rounded-3 p-3 mb-4">
                            <div class="d-flex gap-3">
                                <div class="text-primary fs-4"><i class="bi bi-info-circle-fill"></i></div>
                                <div>
                                    <h6 class="fw-bold mb-1">Detail Laporan</h6>
                                    <p class="text-muted small mb-2">Anda akan mengunduh data untuk periode <strong>{{ $period->name }}</strong>.</p>
                                    <div class="d-flex align-items-center gap-2">
                                        <span class="small text-muted">Status:</span>
                                        <span class="badge bg-warning-subtle text-warning border border-warning rounded-pill px-3">{{ $period->status }}</span>
                                    </div>
                                    <p class="text-muted small mt-2 mb-0">Laporan ini mencakup dashboard skor keseluruhan, visualisasi chart per domain, detail penilaian dari 94 kontrol, beserta status review terkait.</p>
                                </div>
                            </div>
                        </div>

                        <div class="row g-3">
                            <div class="col-md-6">
                                <a href="{{ route('reports.export', ['format' => 'excel', 'period' => $period->id]) }}" 
                                   class="btn btn-success btn-lg w-100 fw-bold d-flex align-items-center justify-content-center gap-2">
                                    <i class="bi bi-file-earmark-spreadsheet"></i> Export Excel (.xlsx)
                                </a>
                            </div>
                            <div class="col-md-6">
                                <a href="{{ route('reports.export', ['format' => 'pdf', 'period' => $period->id]) }}" 
                                   class="btn btn-danger btn-lg w-100 fw-bold d-flex align-items-center justify-content-center gap-2">
                                    <i class="bi bi-file-earmark-pdf"></i> Export PDF
                                </a>
                            </div>
                        </div>
                        @endif

                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>