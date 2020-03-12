<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

/**
 * 内容管理
 */
class Content extends Controller
{
    public function index(Request $req){
        // $data = DB::table('xpcms_article')->mypages();
        $type = (int)$req->type;
        $wd = trim($req->wd);
        if($wd){
            if($type){
                $type == 1 && $_where[] = ['title','like','%'.$wd.'%'];
                $type == 2 && $_where[] = ['author','like','%'.$wd.'%'];
            }
        }
        if(!$wd){
            $_where =[];
        }
        $appends = ['type'=>$type,'wd'=>$wd];
        $data = DB::table('xpcms_article')->where($_where)->mypages(12,$appends);
        $data['type'] = $type;
        $data['wd'] = $wd ;
        $data['category'] = DB::table('xpcms_article_category')->mycates('id');
        $data['menu_title'] = $req->admin->menu_title;
        return view('Admins.Content.index',$data);
    }
    //添加功能
    public function add(Request $req){
        $aid = (int)$req->id;
        $data['category'] = DB::table('xpcms_article_category')->mycates('id');
        $data['article'] = DB::table('xpcms_article')->where('id',$aid)->myfind();
        $contents = DB::table('xpcms_article_content')->where('aid',$aid)->myfind();
        $contents && $data['article']['contents'] = $contents;
        $data['menu_title'] = $req->admin->menu_title;
        return view('Admins.Content.add',$data);
    }
    //删除功能
    public function del(Request $req){
        $aid = (int)$req->id;
        $article = DB::table('xpcms_article')->where('id',$aid)->myfind();
        if(!$article){
            exit(json_encode(array('code'=>1,'msg'=>'文章不存在')));
        }
        $detail = DB::table('xpcms_article_content')->where('aid',$aid)->myfind();
        if(!$detail){
            DB::table('xpcms_article')->where('id',$aid)->delete();
        }else{
            DB::table('xpcms_article')->where('id',$aid)->delete();
            DB::table('xpcms_article_content')->where('aid',$aid)->delete();
        }
        exit(json_encode(array('code'=>0,'msg'=>'操作成功')));
    }
    //保存功能
    public function save(Request $req){
        $id = (int)$req->id;
        $data['title'] = trim($req->title);
        $data['subtitle'] = trim($req->subtitle);
        $data['cate_id'] = (int)$req->cate_id;
        $data['seo_title'] = trim($req->seo_title);
        $data['keyword'] = trim($req->keyword);
        $data['descs'] = trim($req->descs);
        $data['author'] = trim($req->author);
        $data['from_url'] = trim($req->from_url);
        $data['status'] = (int)$req->status;
        $data['is_comment'] = (int)$req->is_comment;
        $data['cover_img'] = trim($req->cover_img);
        $contents = trim($req->contents);
        if($data['title'] == ''){
            exit(json_encode(array('code'=>1,'msg'=>'标题不能为空')));
        }
        if($data['cate_id'] == ''){
            exit(json_encode(array('code'=>1,'msg'=>'请选择分类')));
        }
        if(strlen($data['title'])>90){
            exit(json_encode(array('code'=>1,'msg'=>'标题不能超过30个字')));
        }
        if(strlen($data['subtitle'])>90){
            exit(json_encode(array('code'=>1,'msg'=>'副标题不能超过30个字')));
        }
        if(strlen($data['author'])>30){
            exit(json_encode(array('code'=>1,'msg'=>'作者不能超过10个字')));
        }
        if($id){
            $data['edit_time'] = time();
            $insert=DB::table('xpcms_article')->where('id',$id)->update($data);
            $isContent =  DB::table('xpcms_article_content')->where('aid',$id)->myfind();
            if($insert && $contents && $isContent){
                $detail = ['contents'=>$contents];
                DB::table('xpcms_article_content')->where('aid',$id)->update($detail);
            }
            if($insert && $contents && !$isContent){
                $detail = ['aid'=>$id,'contents'=>$contents];
                DB::table('xpcms_article_content')->insert($detail);
            }
        }else{
            $data['add_time'] = time();
            $data['edit_time'] = time();
            $insert = DB::table('xpcms_article')->insertGetId($data);
            if($insert && $contents){
                $detail = ['aid'=>$insert,'contents'=>$contents];
                DB::table('xpcms_article_content')->insert($detail);
            }
            if($insert && !$contents){
                $detail = ['aid'=>$insert,'contents'=>''];
                DB::table('xpcms_article_content')->insert($detail);
            }

        }
        if(!$insert){
            exit(json_encode(array('code'=>1,'msg'=>'操作失败')));
        }
        exit(json_encode(array('code'=>0,'msg'=>'操作成功')));
    }
}