<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoriesController;
Route::get('/', function () {
    return view('welcome');
});
Route::get('category',[CategoriesController::class,'getCategory']);
Route::post('editCategory/{id}', [CategoriesController::class, 'editCategory'])->name('editCategory.update');