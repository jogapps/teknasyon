<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Carbon;

use App\Models\Devices;
use App\Models\Subscription;

class SubscriptionController extends Controller
{
    /**
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function subscribe(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'token' => 'required',
            'receipt' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 401);
        }

        $receipt = $request['receipt'];
        $token = $request['token'];

        $deviceUser = Devices::where(['token' => $token, 'deleted_at' => null])->first();

        // calling the google/ios mock api

        if($deviceUser->os == "android") {
            $request = Request::create('/api/v12/google-ios', 'POST', $request->all());
        $response = Route::dispatch($request);
        $verificationStatus  = $response->original['verified'];
        } else {
         // it is ios
         $request = Request::create('/api/v12/google-ios', 'POST', $request->all());
        $response = Route::dispatch($request);
        $verificationStatus  = $response->original['verified'];
        }


        if ($verificationStatus) {
            // time returned from apple/Google utc-6
            $verifExpirydate = $response->original['expiry_date'];

            // time converted to turkey time utc
            $verifExpirydate = Carbon::parse($verifExpirydate . '  America/Chicago')->tz('UTC')->format('Y-m-d H:i:s');

            // check if token is valid
            $tokenExists = Devices::where(['token' => $token, 'deleted_at' => null])->exists();

            if ($tokenExists) {
                // check if token exists already in subscription table
                $subTokenExist = Subscription::where(['token' => $token, 'deleted_at' => null])->exists();
                if ($subTokenExist) {
                    $subscription = Subscription::where(['token' => $token, 'deleted_at' => null])->first();
                    $subscription->update([
                        'status' => "renewed",
                        "expires_at" => $verifExpirydate,
                    ]);
                    return response()->json([
                        'status' => true,
                        'message' => "Subscription updated successfully",
                        "expiry_date" => $verifExpirydate
                    ]);
                } else {
                    $subscription = Subscription::create([
                        'appId' => $deviceUser->appId,
                        'os' => $deviceUser->os,
                        'token' => $token,
                        'receipt' => $receipt,
                        'status' => "new",
                        'expires_at' => $verifExpirydate,
                    ]);
                    return response()->json([
                        'status' => true,
                        'message' => "Subscription created successfully",
                        "expiry_date" => $verifExpirydate
                    ]);
                }
            } else {
                return response()->json([
                    'status' => false,
                    'message' => "Invalid token"
                ]);
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => "Invalid receipt"
            ]);
        }
    }

    /**
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function status(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'token' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 401);
        }
        $token = $request['token'];
        $subTokenExist = Subscription::where(['token' => $token, 'deleted_at' => null])->exists();
        if ($subTokenExist) {
            $subscription = Subscription::where(['token' => $token, 'deleted_at' => null])->first();
                    return response()->json([
                    'status' => $subscription->status,
                    'expiry_date' => $subscription->expires_at,
                ]);

        //    $currentTime = Carbon::parse(now())->format('Y-m-d H:i:s');
        //     $expiryDate = Carbon::parse($subscription->expires_at)->format('Y-m-d H:i:s');
        //     if($expiryDate < $currentTime) {
        //         return response()->json([
        //             'status' => 'expired',
        //             'expiry_date' => $subscription->expires_at,
        //         ]);
        //     } else {
        //         $createdAt = Carbon::parse($subscription->created_at)->format('Y-m-d H:i:s');
        //         $updatedAt = Carbon::parse($subscription->updated_at)->format('Y-m-d H:i:s');
        //         if($createdAt == $updatedAt) {
        //             return response()->json([
        //                 'status' => 'new',
        //                 'expiry_date' => $subscription->expires_at,
        //             ]);
        //         } else {
        //             return response()->json([
        //                 'status' => 'renewed',
        //                 'expiry_date' => $subscription->expires_at,
        //             ]);
        //         }
        //     }
        }
        return response()->json([
            'status' => false,
            'message' => "Invalid token",
        ]);
    }

    /**
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function subscriptionByDay(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'date' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 401);
        }
        try {
            $date = Carbon::parse($request['date'])->format('Y-m-d H:i:s');
            $daySubscription = Subscription::where(['created_at' => $date, 'deleted_at' => null])->get();
            return response()->json([
                'status' => true,
                'message' => "Subscription fetched successfully!",
                'data' => $daySubscription
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => "Invalid date",
            ]);
        }
    }

    /**
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function subscriptionByOs(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'os' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 401);
        }

        $osSubscription = Subscription::where(['os' => $request['os'], 'deleted_at' => null])->get();
            return response()->json([
                'status' => true,
                'message' => "Subscription fetched successfully!",
                'data' => $osSubscription
            ]);
    }


    /**
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function subscriptionByApp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'app_id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 401);
        }

        $appSubscription = Subscription::where(['appId' => $request['app_id'], 'deleted_at' => null])->get();
            return response()->json([
                'status' => true,
                'message' => "Subscription fetched successfully!",
                'data' => $appSubscription
            ]);
    }
}
