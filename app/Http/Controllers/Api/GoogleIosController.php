<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Validator;

class GoogleIosController extends Controller
{
    /**
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function verify(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'receipt' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'error' => $validator->errors()
            ], 401);
        }
        $receipt = $request['receipt'];
        $lastDigit = substr($receipt, -1);

        $oddValues = array("1", "3", "5", "7", "9");
        if (in_array($lastDigit, $oddValues)) {
            $carbon = Carbon::parse(now());
            return response()->json([
                'verified' => true,
                //'expiry_date' => $carbon->add(30, 'day')->format('Y-m-d H:i:s'),
                'expiry_date' => Carbon::now()->addDays(rand(1, 30))->format('Y-m-d H:i:s'),
            ]);
        }
        return response()->json([
            'verified' => false,
            'message' => "Invalid receipt",
        ]);
    }
}
