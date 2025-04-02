<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class House extends Model
{
     /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name','owner_id','date_built','house_img', 'bio', 'job'];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];
}
