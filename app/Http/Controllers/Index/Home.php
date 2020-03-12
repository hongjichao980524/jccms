<?php

namespace App\Http\Controllers\Index;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
/**
 * 主页
 */
class Home extends Controller
{
    public function index(Request $req){
        $site_basic =DB::table('xpcms_sys_setting')->where('keys','site_basic')->myfind();
        $uid = (int)$req->admin->id;
        $notes = DB::table('xpcms_notes')->where('uid',$uid)->orderBy('edit_time','desc')->mylists();
        if(!$notes){
            $note = ['title'=>'默认标题','uid'=>$uid,'content'=>'请输入内容','edit_time'=>time()];
            DB::table('xpcms_notes')->insert($note);
            return;
        }
        $data['notes'] =$notes;
        $data['basic'] = json_decode($site_basic['values'],true);
        $data['admin'] = $req->admin->toarray();
        return view('Index.Home.index',$data);
    }
}