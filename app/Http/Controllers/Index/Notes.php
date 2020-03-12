<?php

namespace App\Http\Controllers\Index;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
/**
 * 前台笔记详情页
 */
class Notes extends Controller
{
    //笔记主页
    public function index(Request $req){
        $note_id = $req->id;
        $data['note'] = DB::table('xpcms_notes')->where('id',$note_id)->myfind();
        return view('Index.Notes.index',$data);
    }
    //添加笔记
    public function add(Request $req){
        $uid = $req->admin->id;
        $data['title'] = '默认标题';
        $data['uid'] = $uid;
        $data['content'] = '请输入内容';
        $data['edit_time'] = time();
        $res = DB::table('xpcms_notes')->insert($data);
        if(!$res){
            exit(json_encode(array('code'=>1,'msg'=>'添加失败')));
        }
        exit(json_encode(array('code'=>0,'msg'=>'添加成功')));

    }
    //删除笔记
    public function del(Request $req){
        $uid = (int)$req->admin->id;
        $note_id = (int)$req->note_id;
        $res = DB::table('xpcms_notes')->where(['uid'=>$uid,'id'=>$note_id])->delete();
        if(!$res){
            exit(json_encode(array('code'=>1,'msg'=>'删除失败')));
        }
        exit(json_encode(array('code'=>0,'msg'=>'删除成功')));
    }
    //保存笔记
    public function save(Request $req){
        $note_id = (int)$req->id;
        $data['title']  = trim($req->title);
        $data['content']  = $req->content;
        if($data['title'] == ''){
            exit(json_encode(array('code'=>1,'msg'=>'标题不能为空')));
        }
        if($data['content'] == ''){
            $content == '默认内容';
        }
        $data['edit_time'] = time();
        DB::table('xpcms_notes')->where('id',$note_id)->update($data);
        exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
    }
}