<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Domain extends Model
{
    protected $fillable = ['code', 'name', 'order'];

    public function subdomains(): HasMany
    {
        return $this->hasMany(Subdomain::class)->orderBy('order');
    }

    public function controls(): HasMany
    {
        return $this->hasManyThrough(Control::class, Subdomain::class);
    }
}
