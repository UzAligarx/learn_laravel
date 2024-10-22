<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\LanguageController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\PostController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::resource('posts' , PostController::class)->middleware('auth');
Route::resource('comments' , CommentController::class)->middleware('auth');
Route::resource('notifications' , NotificationController::class)->middleware('auth');

Route::get('category/{id}' , [PostController::class , 'sortedByCategory'])->name('sortedCategory');
Route::get('login' , [AuthController::class , 'login']) -> name('login');
Route::post('authenticate' , [AuthController::class , 'authenticate']) -> name('authenticate');
Route::get('logout' , [AuthController::class , 'logout']) -> name('logout');

Route::get('languages/{locale}' , [LanguageController::class , 'set_locale'])->name('locale');

Route::get('register' , [AuthController::class , 'register'])->name('register');
Route::get('registerStore' , [AuthController::class , 'registrStore'])->name('registr.store');
