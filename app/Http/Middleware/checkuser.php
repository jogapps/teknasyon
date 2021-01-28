<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class checkuser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if ($request->session()->get('user_id') === null) {
            return redirect('/');
        } 
        elseif($request->session()->get('user_id') !== null) {
            //return back();
        }
        return $next($request);
    }
}
