<?php

namespace App\Http\Controllers\Index;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
/**
 * 图片上传
 */
class Image extends Controller
{
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