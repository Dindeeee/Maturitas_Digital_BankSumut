<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class AssessmentPeriod extends Model
{
    protected $fillable = ['year', 'name', 'status', 'start_date', 'end_date', 'created_by'];

    protected function casts(): array
    {
        return [
            'start_date' => 'date',
            'end_date'   => 'date',
        ];
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function controlResults(): HasMany
    {
        return $this->hasMany(AssessmentControlResult::class);
    }

    public function scoreCaches(): HasMany
    {
        return $this->hasMany(ScoreCache::class);
    }

    public function isActive(): bool
    {
        return $this->status === 'active';
    }
}
