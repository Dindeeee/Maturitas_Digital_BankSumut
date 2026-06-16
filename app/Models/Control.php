<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Control extends Model
{
    protected $fillable = ['subdomain_id', 'code', 'title', 'description', 'order'];

    public function subdomain(): BelongsTo
    {
        return $this->belongsTo(Subdomain::class);
    }

    public function subControls(): HasMany
    {
        return $this->hasMany(SubControl::class)->orderBy('order');
    }

    public function divisions(): BelongsToMany
    {
        return $this->belongsToMany(Division::class, 'control_divisions');
    }

    public function results(): HasMany
    {
        return $this->hasMany(AssessmentControlResult::class);
    }
}
