<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

/**
 * 笔记系统
 */
class Notes extends Controller
{
    //笔记列表
    public function index(Request $req){
        $uid = (int)$req->uid;
        if($uid){
            $where[] = ['uid',$uid];
        }else{
            $where = [];
        }
        $append=['uid'=>$uid];
        $data = DB::table('xpcms_notes')->where($where)->mypages(10,$append);
        $data['user'] = DB::table('member')->mycates('id');
        $data['menu_title'] = $req->admin->menu_title;
        return view('Admins.notes.index',$data);
    }
    //编辑
    public function add(Request $req){
        $note_id = (int)$req->id;
        $data['menu_title'] = $req->admin->menu_title;
        $data['note'] = DB::table('xpcms_notes')->where('id',$note_id)->myfind();
        $data['user'] = DB::table('member')->mycates('id');
        return view('Admins.Notes.add',$data);
    }
    //删除
    public function del(Request $req){
        $note_id = (int)$req->id;
        $note = DB::table('xpcms_notes')->where('id',$note_id)->myfind();
        if(!$note){
            exit(json_encode(array('code'=>1,'msg'=>'该笔记不存在')));
        }
        $res = DB::table('xpcms_notes')->where('id',$note_id)->delete();
        if(!$res){
            exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
        }
        exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
    }
    //保存
    public function save(Request $req){
        $id = (int)$req->id;
        $title = trim($req->title);
        $uid = (int)$req->uid;
        $content = trim($req->content);
        if($title==''){
            exit(json_encode(array('code'=>1,'msg'=>'标题不能为空')));
        }
        if($uid==''){
            exit(json_encode(array('code'=>1,'msg'=>'请选择归属用户')));
        }
        if($content==''){
            $content = '请输入内容';
        }
        $data['title'] = $title;
        $data['uid'] = $uid;
        $data['content'] = $content;
        $data['edit_time'] = time();
        $res = DB::table('xpcms_notes')->where('id',$id)->update($data);
        if(!$res){
            exit(json_encode(array('code'=>1,'msg'=>'操作失败')));
        }
        exit(json_encode(array('code'=>0,'msg'=>'操作成功')));
    }
}