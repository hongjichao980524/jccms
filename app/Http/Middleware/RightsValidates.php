<?php 
namespace app\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

/**
 * 后台权限控制中间件
 */

class RightsValidates{

    public function handle($request,Closure $next){
        //获取登录信息
        $admin = Auth::user();
        // 获取角色信息
        $role = DB::table('xpcms_admin_group')->where('gid',$admin->group_id)->first();
        //判断角色
        if(!$role){
            return response($this->_noRights($request,'该角色不存在'),200);
        }
        // 角色权限
        $role->rights = json_decode($role->rights,true);
        // 获取url请求
        $actions = $request->route()->getActionName(); //获取url请求
        $actions_arr = explode('@',$actions);   //分割url
        $controllers = explode('\\',$actions_arr[0]); //分割url
        //获取控制器
        $controller = $controllers[count($controllers)-1];
        //获取方法
        $action = $actions_arr[1];
        //查询菜单
        $menu = DB::table('xpcms_admin_menu')->where('controller',$controller)->where('action',$action)->first();
        //判断功能
        if(!$menu){
            return response($this->_noRights($request,'该功能不存在'),200);
        }
        if($menu->status == 1){
            return response($this->_noRights($request,'该菜单被禁用'),200);
        }
        //判断角色权限
        if(!in_array($menu->mid,$role->rights)){
            return response($this->_noRights($request,'您没有权限访问该功能'),200);
        }
        $admin->menu_title = $menu->title;
        $admin->rights = $role->rights;
        $request->admin = $admin;
        return $next($request);
    }

    //无权限返回
    public function _noRights($request,$msg){
        if($request->ajax()){
             $response = json_encode(array('code'=>1,'msg'=>$msg));
        }else{
             $response = '<div style="font-size:50px;text-align:center;margin:15px auto;">'.$msg.'</div>';
        }
        return $response;
    }
}