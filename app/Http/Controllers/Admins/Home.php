<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

/**
 * 后台主页
 */
class Home extends Controller
{
    // 后台主页
    public function index(Request $req){
        //RightsValidates中间件传来的用户信息
        $data['_admin'] = $req->admin->toArray();
        $data['menus'] = $this->get_menus($req->admin);       
        return view('Admins.Home.index',$data);
    }
    // 后台欢迎页
    public function welcome(){
        return view('Admins.Home.welcome');
    }
    //获取菜单(根据不同角色获取菜单)
    private function get_menus($admin){
        //$admin为用户信息 $admin->rights 为权限结果集
        $menus = DB::table('xpcms_admin_menu')->where('pid',0)->where('ishidden',0)->whereIn('mid',$admin->rights)->orderBy('ord','asc')->mylists();
        foreach($menus as $key => $val){
            $menus[$key] = $val;
            $children = DB::table('xpcms_admin_menu')->where('pid',$val['mid'])->where('ishidden',0)->whereIn('mid',$admin->rights)->mylists();
            foreach($children as $k => $v){
                $children[$k] = $v;
            }
            $menus[$key]['children'] = $children;
        }
        return $menus;
	}
}
