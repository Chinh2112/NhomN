<?php

namespace App\Models;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
class Trainers extends Authenticatable
{
    protected $table = 'trainers';
    protected $primaryKey = 'trainer_id';
    protected $fillable = ['trainer_name', 'trainer_email','user_id','trainer_phone'];
    use HasFacTory, Notifiable;

}
