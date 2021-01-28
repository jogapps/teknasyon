<?php


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::prefix('v12/')->group(function () {

    // register
    Route::post('register', 'App\Http\Controllers\Api\RegistrationController@register');

    // google/ios dummy api
    Route::post("google-ios", 'App\Http\Controllers\Api\GoogleIosController@verify');

    // subscribe
    Route::prefix('subscribe/')->group(function(){
        Route::post('', 'App\Http\Controllers\Api\SubscriptionController@subscribe');
        Route::post('status', 'App\Http\Controllers\Api\SubscriptionController@status');
    });

    // subscription details
    Route::prefix('subscription/')->group(function(){
        Route::post('day', 'App\Http\Controllers\Api\SubscriptionController@subscriptionByDay');
        Route::post('os', 'App\Http\Controllers\Api\SubscriptionController@subscriptionByOs');
        Route::post('app', 'App\Http\Controllers\Api\SubscriptionController@subscriptionByApp');
    });
});

