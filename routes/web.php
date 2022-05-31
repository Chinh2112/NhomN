<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\CustomAuthController;
use App\Http\Controllers\EditingController;


Route::get('/', function () {
    return view('welcome');
});
Route::get('products',[ProductsController::class,'getProducts'])->middleware('per_page');
Route::get('products',[ProductsController::class,'index']);






// Route:
//authentication
Route::get('dashboard', [CustomAuthController::class, 'dashboard']);
Route::get('login', [CustomAuthController::class, 'index'])->name('login');
Route::post('custom-login', [CustomAuthController::class, 'customLogin'])->name('login.custom');
Route::get('registration', [CustomAuthController::class, 'registration'])->name('register-user');
Route::post('custom-registration', [CustomAuthController::class, 'customRegistration'])->name('register.custom');
Route::get('signout', [CustomAuthController::class, 'signOut'])->name('signout');



//Edit Product
Route::post('editProducts/{id}', [ProductsController::class, 'editProducts'])->name('editProducts.update');



