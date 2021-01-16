<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::get('/post','PostController@post')->middleware('auth');
Route::get('/edit/{id}','PostController@edit')->middleware('auth');
Route::post('/editpost/{id}','PostController@updatepost')->middleware('auth');
Route::get('/delete/{id}','PostController@deletePost')->middleware('auth');
Route::post('/addpost','PostController@addpost')->middleware('auth');

Route::get('/category','CategoryController@category')->middleware('auth');
Route::post('/addcategory','CategoryController@addcategory')->middleware('auth');
Route::get('/profile','ProfileController@profile')->middleware('auth');
Route::post('/addprofile','ProfileController@addprofile')->middleware('auth');
Route::get('/category/{id}','PostController@category')->middleware('auth');
Route::get('/view/{id}','PostController@view')->middleware('auth');
Route::get('/category/{id}','PostController@category')->middleware('auth');
Route::get('/edit_profile/{id}','ProfileController@edit_profile')->middleware('auth');
Route::post('/updateprofile/{id}','ProfileController@updateprofile')->middleware('auth');



Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
