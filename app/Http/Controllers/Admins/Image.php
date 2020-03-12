<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

/**
 * 图片上传
 */
class Image extends Controller
{
    //通用
    public function index(Request $req){
        $path = $req->file('file')->store('public/static/images');   
        $url = Storage::url($path);
        if(!$path){
            exit(json_encode(array('code'=>1,'msg'=>'上传失败')));
        }
        $data = ['src'=>$url,'title'=>'images'];
        exit(json_encode(array('code'=>0,'msg'=>'上传成功','url'=>$url,'data'=>$data)));
    }
    //商城
    public function shop(Request $req){
        $path = $req->file('file')->store('public/static/shop/images');
        if(!$path){
            exit(json_encode(array('code'=>1,'msg'=>'上传失败')));
        }
        $url = Storage::url($path);
        $data = ['src'=>$url,'title'=>'images'];
        exit(json_encode(array('code'=>0,'msg'=>'上传成功','url'=>$url,'data'=>$data)));
    }
    //笔记
    public function note(Request $req){
        $path = $req->file('file')->store('public/static/note/images');
        if(!$path){
            exit(json_encode(array('code'=>1,'msg'=>'上传失败')));
        }
        $url = Storage::url($path);
        $data = ['src'=>$url,'title'=>'images'];
        exit(json_encode(array('code'=>0,'msg'=>'上传成功','url'=>$url,'data'=>$data)));
    }
}