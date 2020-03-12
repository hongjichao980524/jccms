<?php 
namespace app\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

/**
 * 前台登录中间件
 */

class AuthMember{

    public function handle($request,Closure $next,$guard = null){
        $refer = base64_encode($request->fullUrl());
        if(Auth::guard('member')->guest()){
            if($request->ajax()){
                return response('error',201);
            }
             return redirect()->guest('account/login?refer='.$refer);
        }
        $admin = Auth::guard('member')->user();
        $request->admin = $admin;
        return $next($request);
    }   
}