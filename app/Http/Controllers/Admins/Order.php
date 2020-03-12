<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

/**
 * 订单管理
 */
class Order extends Controller
{
    public function add(Request $req){
        $id = (int)$req->id;
        if(!$id){
           return redirect()->guest('admins/products/orderlists');
        }
        $order = DB::table('xpcms_order')->where('id',$id)->myfind();
        if(!$order){
            exit('没有该订单');
        }
        $data['order'] = $order;
        return view('Admins.Order.add',$data);
    }
    public function save(Request $req){
        $id = (int)$req->id;
        $data['money'] = (int)$req->money;
        $data['status'] = (int)$req->status;
        if($data['money'] == ''){
            exit(json_encode(array('code'=>1,'msg'=>'金额不能为空')));
        }
        DB::table('xpcms_order')->where('id',$id)->update($data);
        exit(json_encode(array('code'=>0,'msg'=>'修改成功')));
    }
}