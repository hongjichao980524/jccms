<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Config;
/**
 * 后台用户分组管理
 */
class Usergroups extends Controller
{
    //列表
    public function index(Request $req){
        $data = DB::table('xpcms_user_group')->mypages(10);
        $data['menu_title'] = $req->admin->menu_title;
        return view('Admins.Usergroups.index',$data);
    }
    //添加编辑
    public function add(Request $req){
        $gid = (int)$req->gid;
        $data['group'] = DB::table('xpcms_user_group')->where('gid',$gid)->myfind();
        $data['menu_title'] = $req->admin->menu_title;
        return view('Admins.Usergroups.add',$data);
    }
    //删除
    public function del(Request $req){
        $gid = (int)$req->gid;
        $group = DB::table('xpcms_user_group')->where('gid',$gid)->myfind();
        if(!$group){
            exit(json_encode(array('code'=>1,'msg'=>'分组不存在')));
        }
        $res = DB::table('xpcms_user_group')->where('gid',$gid)->delete();
       if(!$res){
            exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
       }
            exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
    }
    //保存
    public function save(Request $req){
        $gid = (int)$req->gid;
        $data['title'] = trim($req->title);
        $data['points'] = (int)$req->points;
        $data['allow_size'] = (int)$req->allow_size;
        $data['allow_search'] = (int)$req->allow_search;
        $data['auto_upgrade'] = (int)$req->auto_upgrade;
        $data['allow_pub'] = (int)$req->allow_pub;
        if($data['title'] == ''){
            exit(json_encode(array('code'=>1,'msg'=>'分组名不能为空')));
        }
        if($gid){
            $res = DB::table('xpcms_user_group')->where('gid',$gid)->update($data);
        }else{
            $res = DB::table('xpcms_user_group')->insert($data);
        }
        if(!$res){
            exit(json_encode(array('code'=>1,'msg'=>'操作失败或者无操作')));
        }
        exit(json_encode(array('code'=>0,'msg'=>'操作成功')));
    }
}