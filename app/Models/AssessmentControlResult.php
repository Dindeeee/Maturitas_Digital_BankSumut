<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class AssessmentControlResult extends Model
{
    protected $fillable = [
        'assessment_period_id', 'control_id',
        'penjelasan_aktor', 'penjelasan_dokumen', 'penjelasan_kontrol',
        'rekomendasi', 'referensi_dokumen',
        'review_progress', 'reviewed_by', 'reviewed_at',
    ];

    protected function casts(): array
    {
        return ['reviewed_at' => 'datetime'];
    }

    public function period(): BelongsTo
    {
        return $this->belongsTo(AssessmentPeriod::class, 'assessment_period_id');
    }

    public function control(): BelongsTo
    {
        return $this->belongsTo(Control::class);
    }

    public function reviewer(): BelongsTo
    {
        return $this->belongsTo(User::class, 'reviewed_by');
    }

    public function subResults(): HasMany
    {
        return $this->hasMany(AssessmentSubControlResult::class);
    }
}
