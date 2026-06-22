<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AssessmentPeriod;
use App\Models\Control;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class PeriodController extends Controller
{
    public function index(): View
    {
        $periods = AssessmentPeriod::with('creator')
            ->withCount('controlResults')
            ->orderByDesc('year')
            ->orderByDesc('id')
            ->get();

        return view('admin.periods.index', compact('periods'));
    }

    public function store(Request $request): RedirectResponse
    {
        $data = $request->validate([
            'year'       => ['required', 'integer', 'min:2020', 'max:2100'],
            'name'       => ['required', 'string', 'max:255'],
            'start_date' => ['required', 'date'],
            'end_date'   => ['required', 'date', 'after_or_equal:start_date'],
        ]);

        $data['status']     = 'draft';
        $data['created_by'] = $request->user()->id;
        AssessmentPeriod::create($data);

        return redirect()->route('admin.periods.index')
            ->with('success', 'Periode berhasil dibuat (status: Draft).');
    }

    public function update(Request $request, AssessmentPeriod $period): RedirectResponse
    {
        if ($period->status === 'completed') {
            return back()->with('error', 'Periode yang sudah ditutup tidak dapat diedit.');
        }

        $data = $request->validate([
            'year'       => ['required', 'integer', 'min:2020', 'max:2100'],
            'name'       => ['required', 'string', 'max:255'],
            'start_date' => ['required', 'date'],
            'end_date'   => ['required', 'date', 'after_or_equal:start_date'],
        ]);

        $period->update($data);

        return redirect()->route('admin.periods.index')
            ->with('success', 'Periode berhasil diperbarui.');
    }

    /**
     * Aktifkan periode draft & generate baris hasil untuk 94 kontrol + sub-kontrol.
     */
    public function activate(AssessmentPeriod $period): RedirectResponse
    {
        if ($period->status !== 'draft') {
            return back()->with('error', 'Hanya periode berstatus Draft yang dapat diaktifkan.');
        }

        $controls = Control::with('subControls:id,control_id')->get();
        $now = Carbon::now();

        DB::transaction(function () use ($period, $controls, $now) {
            $period->update(['status' => 'active']);

            foreach ($controls as $control) {
                $acrId = DB::table('assessment_control_results')->insertGetId([
                    'assessment_period_id' => $period->id,
                    'control_id'           => $control->id,
                    'review_progress'      => 'pending',
                    'created_at'           => $now,
                    'updated_at'           => $now,
                ]);

                $subRows = $control->subControls->map(fn ($sc) => [
                    'assessment_control_result_id' => $acrId,
                    'sub_control_id'               => $sc->id,
                    'status'                       => null,
                    'skor'                         => null,
                    'created_at'                   => $now,
                    'updated_at'                   => $now,
                ])->all();

                if ($subRows) {
                    DB::table('assessment_sub_control_results')->insert($subRows);
                }
            }
        });

        return redirect()->route('admin.periods.index')
            ->with('success', 'Periode diaktifkan. Lembar assessment untuk semua kontrol telah dibuat.');
    }

    public function complete(AssessmentPeriod $period): RedirectResponse
    {
        if ($period->status !== 'active') {
            return back()->with('error', 'Hanya periode aktif yang dapat ditutup.');
        }

        $period->update(['status' => 'completed']);

        return back()->with('success', 'Periode ditutup. Data tersimpan sebagai histori.');
    }
}
