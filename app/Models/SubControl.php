<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class SubControl extends Model
{
    protected $fillable = ['control_id', 'label', 'criteria_description', 'order'];

    public function control(): BelongsTo
    {
        return $this->belongsTo(Control::class);
    }

    public function results(): HasMany
    {
        return $this->hasMany(AssessmentSubControlResult::class);
    }
}
