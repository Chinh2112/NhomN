<?php

namespace App\Models;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
class Products extends Authenticatable
{
    protected $table = 'products';
    protected $primaryKey = 'product_id';
    protected $fillable = ['product_name','product_price', 'product_image', 'trainer_id', 'product_description'];
    use HasFacTory, Notifiable;
}
