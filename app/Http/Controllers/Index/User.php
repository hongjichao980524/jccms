<?php

namespace App\Http\Controllers\Index;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
/**
 * 主页
 */
class User extends Controller
{
    //用户资料卡
    public function index(Request $req){
        $uid = (int)$req->uid;
        if(!$uid){
            exit('操作有误，请勿直接访问该链接');
        }
        $user = DB::table('member')->where('id',$uid)->myfind();
        $data['user'] = $user;
        return view('Index.User.index',$data);
    }
    //保存功能
    public function save(Request $req){
        $id = (int)$req->id;
        $password = trim($req->password);
        if(!$id){
            exit(json_encode(array('code'=>1,'msg'=>'操作有误，请勿直接访问')));
        }
        if($password){
            $data['passwrod'] = password_hash($password,PASSWORD_DEFAULT);
            DB::table('member')->where('id',$id)->update($data);
            exit(json_encode(array('code'=>0,'msg'=>'修改成功')));
        }
        exit(json_encode(array('code'=>0,'msg'=>'无操作')));
       
    }
}