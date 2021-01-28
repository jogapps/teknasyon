<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

use App\Models\Devices;


class RegistrationController extends Controller
{
    /**
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json([
        	'status'=> true,
        	'notification' => "Hello"
        	]);
    }

    /**
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'uId' => 'required',
            'appId' => 'required',
            'language' => 'required',
            'os' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 401);
        }

        $uId = $request['uId'];
        $appId = $request['appId'];
        $language = $request['language'];
        $os = $request['os'];

        $check_appId = Devices::where('appId', $appId)->exists();

        if ($check_appId) {
            return response()->json([
                'register' => false,
                'error' => "App Id already exists",
            ]);
        }

        $device = Devices::create([
            'uId' => $uId,
            'appId' => $appId,
            'language' => $language,
            'os' => $os,
            'token' => Str::random(150)
        ]);

        return response()->json([
            'register' => true,
            'message' => "Device registered successfully!",
            'device' => $device,
        ]);
    }
}
