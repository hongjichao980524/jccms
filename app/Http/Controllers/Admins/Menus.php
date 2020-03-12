<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

/**
 * 后台菜单管理
 */
class Menus extends Controller
{
    //菜单列表
    public function index(Request $req){
        //显示菜单名称
        $data['menu_title'] = $req->admin->menu_title;
        //下级菜单
        $pid = (int)$req->pid;
        $data['menu_lists'] = DB::table('xpcms_admin_menu')->where('pid',$pid)->orderBy('ord','asc')->mylists();
        $data['pid'] = $pid;
        //返回上级菜单
        $data['backid'] = 0;
        if($pid>0){
            $parent = DB::table('xpcms_admin_menu')->where('mid',$pid)->myfind();
            $data['backid'] = $parent['pid'];
            // print_r($data['backid']);
        }
        return view('Admins.Menus.index',$data);
    }
    //菜单添加、编辑
    public function add(Request $req){
        $mid = (int)$req->menu_id;
        $data['pid'] = (int)$req->pid;
        $data['menu'] = DB::table('xpcms_admin_menu')->where('mid',$mid)->myfind();
        return view('Admins.Menus.add',$data);
    }
    //菜单删除
    public function delete(Request $req){
        $mid = (int)$req->menu_id;
        $menu = DB::table('xpcms_admin_menu')->where('mid',$mid)->myfind();
        if(!$menu){
            exit(json_encode(array('code'=>1,'msg'=>'菜单不存在')));
        }
        DB::table('xpcms_admin_menu')->where('mid',$mid)->delete();
        exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
    }
    //菜单保存
    public function save(Request $req){
        $mid = (int)$req->mid;
        $data['pid'] = (int)$req->pid;
        $data['title'] = trim($req->title);
        $data['ord'] = (int)$req->ord;
        $data['controller'] = trim($req->controller);
        $data['action'] = trim($req->action);
        $data['ishidden'] = (int)$req->ishidden;
        $data['status'] = (int)$req->status;
        
        if($data['title']==''){
            exit(json_encode(array('code'=>1,'msg'=>'菜单名称不能为空')));
        }
        if($data['pid']>0&&$data['controller']==''){
            exit(json_encode(array('code'=>1,'msg'=>'控制器名称不能为空')));
        }
        if($mid){
            $res = DB::table('xpcms_admin_menu')->where('mid',$mid)->update($data);
        }else{
            $res = DB::table('xpcms_admin_menu')->insert($data);
        }

        exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
    }
}