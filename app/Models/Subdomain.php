<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Subdomain extends Model
{
    protected $fillable = ['domain_id', 'code', 'name', 'order'];

    public function domain(): BelongsTo
    {
        return $this->belongsTo(Domain::class);
    }

    public function controls(): HasMany
    {
        return $this->hasMany(Control::class)->orderBy('order');
    }
}
