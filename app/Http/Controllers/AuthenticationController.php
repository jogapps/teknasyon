<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Session;

class AuthenticationController extends Controller
{

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function signin(Request $request)
    {
        // validate
        $this->validate($request,[
            'user_id' => 'required',
            'password' => 'required',
        ]);

        $userId = $request['user_id'];
        $password = $request['password'];
        $user_exist = User::where('user_id', $userId)->exists();
        if($user_exist) {
            $user = User::where('user_id', $userId)->first();
            if($user->password == $password) {
                // password matches
                session()->put('role', $user->role_id);
                session()->put('user_id', $user->id);
                session()->put('name', $user->name);
                return redirect("/dashboard");

            } else {
                //passwords do not match
                Session::flash('danger', 'Invalid Login Details!');
                return back()->with([
                    'danger' => 'Invalid Login Details',
                ]);
            }
        } else {
            //passwords do not match
                Session::flash('danger', 'Invalid Login Details!');
                return back()->with([
                    'danger' => 'Invalid Login Details',
                ]);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updatePassword(Request $request, $id)
    {
        $user = User::find($id);

        // validate
        $this->validate($request,[
            'new_password' => 'required',
            'confirm_password' => 'required',
        ]);

        if($request['new_password'] == $request['confirm_password']){
                $user->password = $request['new_password'];
                $user->save();

                return back()->with([
                    'success' => 'Password updated!'
                 ]);
        }else{
            return back()->with([
               'danger' => 'Password mis-match, try again!'
            ]);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        $request->session()->flush();
        return redirect("/");
    }
}
