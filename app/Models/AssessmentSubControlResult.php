<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AssessmentSubControlResult extends Model
{
    protected $fillable = [
        'assessment_control_result_id', 'sub_control_id',
        'status', 'skor', 'filled_by', 'filled_at',
    ];

    protected function casts(): array
    {
        return ['filled_at' => 'datetime'];
    }

    public function controlResult(): BelongsTo
    {
        return $this->belongsTo(AssessmentControlResult::class, 'assessment_control_result_id');
    }

    public function subControl(): BelongsTo
    {
        return $this->belongsTo(SubControl::class);
    }

    public function filler(): BelongsTo
    {
        return $this->belongsTo(User::class, 'filled_by');
    }
}
