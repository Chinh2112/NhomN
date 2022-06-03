<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\ProtypeController;
use App\Http\Controllers\SearchController;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\CustomAuthController;
use App\Http\Controllers\DeleteController;
use App\Http\Controllers\EditingController;


Route::get('/', function () {
    return view('welcome');
});
Route::get('products',[ProductsController::class,'getProducts'])->middleware('per_page');
Route::get('products',[ProductsController::class,'index']);
Route::get('protypes',[ProtypeController::class,'getProtype'])->middleware('per_page');
Route::get('search',[SearchController::class,'search'])->middleware('per_page');

Route::get('category',[CategoriesController::class,'getCategory']);
//Add Category
Route::post('addCategory', [CategoriesController::class, 'addCategory'])->name('addCategory');
// Edit Category
Route::post('editCategory/{id}', [CategoriesController::class, 'editCategory'])->name('editCategory.update');
// Delete Category
Route::delete('categories/{id}', [DeleteController::class, 'destroyCategory']);


// Route:
//authentication
Route::get('dashboard', [CustomAuthController::class, 'dashboard']);
Route::get('login', [CustomAuthController::class, 'index'])->name('login');
Route::post('custom-login', [CustomAuthController::class, 'customLogin'])->name('login.custom');
Route::get('registration', [CustomAuthController::class, 'registration'])->name('register-user');
Route::post('custom-registration', [CustomAuthController::class, 'customRegistration'])->name('register.custom');
Route::get('signout', [CustomAuthController::class, 'signOut'])->name('signout');

// Delete Product
Route::delete('products/{id}', [DeleteController::class, 'destroy']);
//Add Product
Route::post('addProducts', [ProductsController::class, 'addProducts'])->name('addProducts');
//Edit Product
Route::post('editProducts/{id}', [ProductsController::class, 'editProducts'])->name('editProducts.update');



// Delete Product Type
Route::delete('protypes/{id}', [DeleteController::class, 'destroyProtype']);
//Edit Product Type
Route::post('editProtype/{id}', [ProtypeController::class, 'editProtype'])->name('editProtype.update');
//Add Product Type
Route::post('addProtype', [ProtypeController::class, 'addProtype'])->name('addProtype');