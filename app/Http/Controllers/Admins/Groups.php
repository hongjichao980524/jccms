<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

/**
 * 后台角色管理
 */
class Groups extends Controller{
    //角色列表
    public function index(Request $req){
        $data['menu_title'] = $req->admin->menu_title;
        $data['group_lists'] = DB::table('xpcms_admin_group')->mylists();
        return view('Admins.Groups.index',$data);
    }
    //角色添加
    public function add(Request $req){
        $gid = (int)$req->gid;
        //查询角色
        $data['role'] = DB::table('xpcms_admin_group')->where('gid',$gid)->myfind();
        if($data['role']['rights']){
            $data['role']['rights'] = json_decode($data['role']['rights'],true);
        }
        //查询全部功能
        $menus = DB::table('xpcms_admin_menu')->where('status',0)->mycates('mid');
        //树形处理
        $menus = $this->getTreeLists($menus);
        //二级菜单转化
        $temp = [];
        foreach($menus as $item){
            $item['children'] = isset($item['children'])?$this->forMateMenus($item['children']):false;
            $temp[] = $item;
        }
        // print_r($data['role']);
        $data['menus'] = $temp;
        return view('Admins.Groups.add',$data);
    }
    //角色编辑保存
    public function save(Request $req){
        $gid = (int)$req->gid;
        $title = trim($req->title);
        $menus = $req->menu;
        //判断角色名称
        if($title==''){
            exit(json_encode(array('code'=>1,'msg'=>'角色名称不能为空')));
        }
        $data['title'] = $title;
        //判断权限
        if(!$menus){
            exit(json_encode(array('code'=>1,'msg'=>'权限不能为空')));
        }
        //获取权限的值 用array_key获取数组键
        $menus && $menus = json_encode(array_keys($menus));
        $data['rights'] = $menus;
        //获取管理员id
        $data['admin_id'] = $req->admin->id;
        //判断添加还是修改
        if($gid){
            $data['edit_time'] = time();
            DB::table('xpcms_admin_group')->where('gid',$gid)->update($data);
        }else{
            $data['add_time'] = $data['edit_time']  = time();
            DB::table('xpcms_admin_group')->insert($data);
        }
        exit(json_encode(array('code'=>0,'msg'=>'操作成功')));
    }

    //树形无限级菜单
    private function getTreeLists($lists){
        $tree= [];
        foreach($lists as $item){
            if(isset($lists[$item['pid']])){
                $lists[$item['pid']]['children'][] = &$lists[$item['mid']];
            }else{
                $tree[] = &$lists[$item['mid']];
            }         
        }
        return $tree;
    }

    //无限级菜单处理
    private function forMateMenus($lists,&$res = array()){
        foreach($lists as $item){
            if(!isset($item['children'])){
                $res[] = $item;
            }else{
                $tmp = $item['children'];
                unset($item['children']);
                $res[] = $item;
                $this->forMateMenus($tmp,$res);
            }
        }
        return $res;
    }
}