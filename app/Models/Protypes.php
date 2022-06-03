<?php

namespace App\Models;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
class Protypes extends Authenticatable
{
    protected $table = 'protypes';
    protected $primaryKey = 'protype_id';
    protected $fillable = ['protype_name','protype_phone'];
    use HasFacTory, Notifiable;

}
