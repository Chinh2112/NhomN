<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DeleteController;

Route::get('/', function () {
    return view('welcome');
});
// Delete Product
Route::delete('products/{id}', [DeleteController::class, 'destroy']);