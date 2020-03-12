<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Config;
/**
 * 后台用户管理列表
 */
class Users extends Controller
{
    //用户列表
    public function index(Request $req){
        $type = $req->type;
        $wd = $req->wd;
        if($wd){
            if($type){
                $type == 1 && $_where[] = ['username',$wd];
            }
        }else{
            $_where = [];
        }
        $append = ['type'=>$type,'wd'=>$wd];
        $data = DB::table('member')->where($_where)->mypages(12,$append);
        $data['type'] = $type;
        $data['wd'] = $wd;
        $data['groups'] = DB::table('xpcms_user_group')->mycates('gid');
        $data['menu_title'] = $req->admin->menu_title;
        return view('Admins.Users.index',$data);
   }
 
   //用户添加编辑功能
    public function add(Request $req){
        $uid = (int)$req->uid;
        $data['user'] = DB::table('member')->where('id',$uid)->myfind();
        $data['groups'] = DB::table('xpcms_user_group')->mylists('gid');
        $data['menu_title'] = $req->admin->menu_title;
        return view('Admins.Users.add',$data);
   }
   //用户删除
   public function del(Request $req){
       $uid = (int)$req->uid;
       $user = DB::table('member')->where('id',$uid)->myfind();
       if(!$user){
           exit(json_encode(array('code'=>1,'msg'=>'用户不存在')));
       }
       $res = DB::table('member')->where('id',$uid)->delete();
       if(!$res){
            exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
       }
            exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
   }
   //保存功能
   public function save(Request $req){
       $id = (int)$req->id;
       $data['username'] = trim($req->username);
       $password = trim($req->password);
       $data['gid'] = (int)$req->gid;
       $data['status'] = (int)$req->status;
       if($data['username']==''){
           exit(json_encode(array('code'=>1,'msg'=>'用户名不能为空')));
       }
       if(!$id && $password == ''){
            exit(json_encode(array('code'=>1,'msg'=>'密码不能为空')));
       }
       if($id){
           if($password){
               $data['password'] = password_hash($password,PASSWORD_DEFAULT);
           }
           DB::table('member')->where('id',$id)->update($data);
       }else{
           $res = DB::table('member')->where('username',$data['username'])->myfind();
           if($res){
                exit(json_encode(array('code'=>1,'msg'=>'用户名已存在')));
           }
           $data['add_time'] = time();
           $data['password'] = password_hash($password,PASSWORD_DEFAULT);
           DB::table('member')->insert($data);
       }
       exit(json_encode(array('code'=>0,'msg'=>'操作成功')));
   }
}