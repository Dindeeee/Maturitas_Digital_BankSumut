<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ScoreCache extends Model
{
    public $timestamps = false;

    protected $fillable = [
        'assessment_period_id', 'scoreable_type', 'scoreable_id',
        'percentage', 'skor', 'category', 'nilai', 'calculated_at',
    ];

    protected function casts(): array
    {
        return [
            'percentage'     => 'decimal:2',
            'skor'           => 'decimal:2',
            'calculated_at'  => 'datetime',
        ];
    }

    public function period(): BelongsTo
    {
        return $this->belongsTo(AssessmentPeriod::class, 'assessment_period_id');
    }
}
