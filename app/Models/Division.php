<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Division extends Model
{
    protected $fillable = ['code', 'name'];

    public function users(): HasMany
    {
        return $this->hasMany(User::class);
    }

    public function controls(): BelongsToMany
    {
        return $this->belongsToMany(Control::class, 'control_divisions');
    }
}
