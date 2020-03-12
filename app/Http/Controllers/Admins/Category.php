<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
/**
 * 分类管理
 */
class Category extends Controller
{
    public function index(Request $req){
        $data['menu_title'] = $req->admin->menu_title;
        $pid = (int)$req->pid;
        $data['cate_lists'] = DB::table('xpcms_article_category')->where('pid',$pid)->mylists();
        $data['backid'] = 0;
        if($pid>0){
            $parent = DB::table('xpcms_article_category')->where('id',$pid)->myfind();
            $data['backid'] = $parent['pid'];
        }
        return view('Admins.Category.index',$data);
    }
    public function add(Request $req){
        $id = (int)$req->id;
        $data['menu_title'] = $req->admin->menu_title;
        $data['category'] = DB::table('xpcms_article_category')->where('pid',0)->mylists();
        $data['cate_value'] = DB::table('xpcms_article_category')->where('id',$id)->myfind();
        return view('Admins.Category.add',$data);
    }
    //保存
    public function save(Request $req){
        $id = $req->id;
        $data['title'] = trim($req->title);
        $data['code'] = trim($req->code);
        $data['pid'] = trim($req->pid);
        $data['seo_title'] = trim($req->seo_title);
        $data['keyword'] = trim($req->keyword);
        $data['descs'] = trim($req->descs);
        $data['edit_time'] = time();
        if($data['title']==''){
            exit(json_encode(array('code'=>1,'msg'=>'分类名称不能为空')));
        }
        if($data['pid']==''){
            exit(json_encode(array('code'=>1,'msg'=>'请选择分类')));
        }
        if($data['keyword']==''){
            exit(json_encode(array('code'=>1,'msg'=>'keyword不能为空')));
        }
        if($data['seo_title']==''){
            exit(json_encode(array('code'=>1,'msg'=>'seo标题不能为空')));
        }
        if($id>0){
            DB::table('xpcms_article_category')->where('id',$id)->update($data);
        }else{
            $data['add_time'] = time();
            DB::table('xpcms_article_category')->insert($data);
        }
        exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
    }
}