<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Control;
use App\Models\Division;
use App\Models\Domain;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class MasterDataController extends Controller
{
    public function index(): View
    {
        $domains = Domain::with([
            'subdomains.controls' => fn ($q) => $q->withCount('subControls')->with('divisions:id,code'),
        ])->orderBy('order')->get();

        $divisions = Division::orderBy('code')->get();

        return view('admin.master-data.index', compact('domains', 'divisions'));
    }

    /**
     * Set divisi PIC untuk satu kontrol (sync pivot control_divisions).
     */
    public function updatePic(Request $request, Control $control): RedirectResponse
    {
        $data = $request->validate([
            'divisions'   => ['array'],
            'divisions.*' => ['integer', 'exists:divisions,id'],
        ]);

        $control->divisions()->sync($data['divisions'] ?? []);

        return back()->with('success', "PIC untuk kontrol {$control->code} diperbarui.");
    }
}
