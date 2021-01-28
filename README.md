## About Teknayson Godspower Project

## Handled Tasks
 - API only
 - Worker only
 - API + Callback
 - Worker + Callback
 - API + Worker
 

## Routes

 - REGISTER DEVICES
 - Route::post('register', 'App\Http\Controllers\Api\RegistrationController@register');

 - DUMMY GOOGLE/IOS DUMMY API
 - Route::post("google-ios", 'App\Http\Controllers\Api\GoogleIosController@verify');

 -  SUBSCRIBE
 -  Route::prefix('subscribe/')->group(function(){
 -      Route::post('', 'App\Http\Controllers\Api\SubscriptionController@subscribe');
 -      Route::post('status', 'App\Http\Controllers\Api\SubscriptionController@status');
 -   });

 -  SUBSCRIPTION DETAILS
 -   Route::prefix('subscription/')->group(function(){
 -      Route::post('day', 'App\Http\Controllers\Api\SubscriptionController@subscriptionByDay');
 -      Route::post('os', 'App\Http\Controllers\Api\SubscriptionController@subscriptionByOs');
 -      Route::post('app', 'App\Http\Controllers\Api\SubscriptionController@subscriptionByApp');
 -   });

## Worker

 - Subscription status is constantly updated using laravel scheduler to change status of subscription to expired


## SQL
 
 - The general sql of the application is teknasyon.sql
 - sql query of subscription based on app is app-subscriptions.sql
 - sql query of subscription based on day is day-subscriptions.sql
 - sql query of subscription based on os is os-subscription.sql 



