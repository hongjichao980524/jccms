<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

/**
 * 商品管理
 */
class Products extends Controller
{
    //主页
    public function index(Request $req){
        $type = (int)$req->type;
        $wd = trim($req->wd);
        if($wd){
            $_where[] = ['title','like','%'.$wd.'%'];
        }else{
            $_where = [];
        }
        $append = ['type'=>$type,'wd'=>$wd];
        $data = DB::table('xpcms_shop')->where($_where)->mypages(12,$append);
        $data['wd'] = $wd;
        $data['menu_title'] = $req->admin->menu_title;
        return view('Admins.Products.index',$data);
    }
    //订单管理
    public function orderlists(Request $req){
        
        $data= DB::table('xpcms_order')->mypages(10);           //订单列表
        $data['menu_title'] = $req->admin->menu_title;          //菜单名称
        $data['user'] = DB::table('member')->mycates('id');     //用户名称
        return view('Admins.Products.orderlists',$data);
    }
    //添加
    public function add(Request $req){
        $id = (int)$req->id;
        $data['shop_detail'] = DB::table('xpcms_shop')->where('id',$id)->myfind();
        $data['category'] = DB::table('xpcms_shop_category')->mycates('id');
        $content = DB::table('xpcms_shop_content')->where('shop_id',$id)->myfind();
        $content && $data['shop_detail']['content'] = $content;
        $data['menu_title'] = $req->admin->menu_title;
        return view('Admins.Products.add',$data);
    }
    //保存
    public function save(Request $req){
        $id = (int)$req->id;
        $data['title'] = trim($req->title);
        $data['subtitle'] = trim($req->subtitle);
        $data['cate_id'] = (int)$req->cate_id;
        $data['count'] = (int)$req->count;
        $data['shop_img'] = trim($req->shop_img);
        $data['seo_title'] = trim($req->seo_title);
        $data['keywords'] = trim($req->keywords);
        $data['price'] = $req->price;
        $data['status'] = (int)$req->status;
        $content = trim($req->contents);
        if($data['title'] == ''){
            exit(json_encode(array('code'=>1,'msg'=>'标题不能为空')));
        }
        if($data['cate_id'] == ''){
            exit(json_encode(array('code'=>1,'msg'=>'请选择分类')));
        }
        if($data['price'] == ''){
            exit(json_encode(array('code'=>1,'msg'=>'价格不能为空')));
        }
        if($data['shop_img'] == ''){
            exit(json_encode(array('code'=>1,'msg'=>'请上传商品主图')));
        }
        if($id){
            $data['edit_time'] = time();
            $insert = DB::table('xpcms_shop')->where('id',$id)->update($data);
            $isContent = DB::table('xpcms_shop_content')->where('shop_id',$id)->myfind();
            if($insert && $content && $isContent){
                DB::table('xpcms_shop_content')->where('shop_id',$id)->update(['content'=>$content]);
            }
            if($insert && $content && !$isContent){
                DB::table('xpcms_shop_content')->insert(['shop_id'=>$id,'content'=>$content]);
            }
            }else{
                $data['add_time'] = $data['edit_time'] = time();
                $insert = DB::table('xpcms_shop')->insertGetID($data);
                if($insert && $content){
                    DB::table('xpcms_shop_content')->insert(['shop_id'=>$insert,'content'=>$content]);
                }
                if($insert && !$content){
                    DB::table('xpcms_shop_content')->insert(['shop_id'=>$insert,'content'=>'']);
                }
        }
        if(!$insert){
            exit(json_encode(array('code'=>1,'msg'=>'操作失败')));
        }
        exit(json_encode(array('code'=>0,'msg'=>'操作成功')));
    }


}