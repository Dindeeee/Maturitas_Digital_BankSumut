<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Division;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\View\View;

class DivisionController extends Controller
{
    public function index(): View
    {
        $divisions = Division::withCount(['users', 'controls'])
            ->orderBy('code')
            ->get();

        return view('admin.divisions.index', compact('divisions'));
    }

    public function store(Request $request): RedirectResponse
    {
        $data = $request->validate([
            'code' => ['required', 'string', 'max:50', 'unique:divisions,code'],
            'name' => ['required', 'string', 'max:255'],
        ]);

        Division::create($data);

        return redirect()->route('admin.divisions.index')
            ->with('success', 'Divisi berhasil ditambahkan.');
    }

    public function update(Request $request, Division $division): RedirectResponse
    {
        $data = $request->validate([
            'code' => ['required', 'string', 'max:50', Rule::unique('divisions', 'code')->ignore($division->id)],
            'name' => ['required', 'string', 'max:255'],
        ]);

        $division->update($data);

        return redirect()->route('admin.divisions.index')
            ->with('success', 'Divisi berhasil diperbarui.');
    }

    public function destroy(Division $division): RedirectResponse
    {
        if ($division->users()->exists()) {
            return back()->with('error', 'Divisi tidak dapat dihapus karena masih memiliki pengguna.');
        }

        $division->controls()->detach();
        $division->delete();

        return redirect()->route('admin.divisions.index')
            ->with('success', 'Divisi berhasil dihapus.');
    }
}
