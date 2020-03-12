<?php
namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
/*
*后台管理员管理
*/
class Admin extends Controller{

    //管理员列表
    public function index(Request $req){
        //数据库查询 管理员信息
        //拓展列表分页查询方法
        $data = DB::table('xpcms_admin')->orderBy('id','asc')->mypages(5);
        //数据库查询 权限组
        //拓展自定义索引列表查询方法 结果为数组
        $data['groups'] = DB::table('xpcms_admin_group')->mycates('gid');
        $data['menu_title'] = $req->admin->menu_title;
        return view('Admins.Admin.index',$data);
    }

    //添加管理员
    public function add(Request $req){
        $data['admin'] = DB::table('xpcms_admin')->where('id',$req->admin_id)->myfind();
        // print_r($data['admin']);
        $data['groups'] = DB::table('xpcms_admin_group')->mylists();
        return view('Admins.Admin.add',$data);
    }
    //保存功能
    public function save(Request $req){
        // 获取数据
        $id = (int)$req->id;
        $username = trim($req->username);
        $password = trim($req->password);
        $data['group_id'] = (int)$req->group_id;
        $data['real_name'] = trim($req->real_name);
        $data['mobile'] = trim($req->mobile);
        $data['status'] = (int)$req->status;
        //当添加管理员时 用户名不能为空
        if($id==0 && $username==''){
            exit(json_encode(array('code'=>1,'msg'=>'用户名不能为空')));
        }
        //当添加管理员时 密码不能为空
        if($id==0 && $password==''){
            exit(json_encode(array('code'=>1,'msg'=>'密码不能为空')));
        }
        //选择用户角色
        if(!$data['group_id']){
            exit(json_encode(array('code'=>1,'msg'=>'请选择角色')));
        }
        //判断是修改还是增加
        if($id){
            //修改功能
            //需要修改密码时
            if($password){
                $admin = DB::table('xpcms_admin')->where('id',$id)->myfind();
                $data['password'] = password_hash($password,PASSWORD_DEFAULT);
            }
            $data['edit_time'] = time();
            //操作
            DB::table('xpcms_admin')->where('id',$id)->update($data);
        }else{
            //添加功能
            $res = DB::table('xpcms_admin')->where('username',$username)->myfind();
            if($res){
                exit(json_encode(array('code'=>1,'msg'=>'用户名已存在')));
            }
            $data['add_time'] = $data['edit_time']=time();
            $data['username']= $username;
            $data['password'] = password_hash($password,PASSWORD_DEFAULT);
            DB::table('xpcms_admin')->insert($data);
        }
        //操作结果
        exit(json_encode(array('code'=>0,'msg'=>'操作成功')));
    }
    //删除功能
    public function del(Request $req){
        $admin_id = $req->admin_id;
        $admin = DB::table('xpcms_admin')->where('id',$admin_id)->myfind();
        // print_r($admin);
        if(!$admin){
            exit(json_encode(array('code'=>1,'msg'=>'用户不存在')));
        }
        $res = DB::table('xpcms_admin')->where('id',$admin_id)->delete();
        if(!$res){
            exit(json_encode(array('code'=>0,'msg'=>'删除失败')));
        }
        //结果
        exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
    }
}