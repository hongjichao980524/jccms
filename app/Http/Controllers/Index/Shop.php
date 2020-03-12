<?php

namespace App\Http\Controllers\Index;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
/**
 * 主页
 */
class Shop extends Controller
{
    //商品主页
    public function index(Request $req){
        $site_basic =DB::table('xpcms_sys_setting')->where('keys','site_basic')->myfind(); //系统信息

        //分类
        $category = DB::table('xpcms_shop_category')->where('pid',0)->mylists(); //顶级分类
        foreach($category as $key => $val){
            $category[$key] = $val;
            $children = DB::table('xpcms_shop_category')->where('pid',$val['id'])->mylists(); //二级分类
            $category[$key]['children'] = $children;
        }
        $data['category'] = $category;
        //系统信息
        $data['basic'] = json_decode($site_basic['values'],true);
        //登录信息
        $data['admin'] = $req->admin->username;
        //商品信息
        $data['shop'] = DB::table('xpcms_shop')->mylists();
        return view('Index.Shop.index',$data);
    }
    //商品详情页
    public function detail(Request $req){
        $shop_id = (int)$req->shop_id;
        $data['admin'] = $req->admin->username; //登录用户信息
        $site_basic =DB::table('xpcms_sys_setting')->where('keys','site_basic')->myfind(); //系统信息
        $data['basic'] = json_decode($site_basic['values'],true);
        $detail = DB::table('xpcms_shop')->where('id',$shop_id)->myfind();
        if(!$detail){
            return redirect()->guest('/shop');
        }
        $content = DB::table('xpcms_shop_content')->where('shop_id',$shop_id)->myfind();
        $detail['content'] = $content['content'];
        $data['detail'] = $detail;
        return view('Index.Shop.detail',$data);
    }
    //商品购买
    public function buy(Request $req){
        $shop_id = (int)$req->shop_id;      //商品id
        $uid = (int)$req->admin->id;        //用户id
        $count = (int)$req->count;          //购买数量
        //检查登录状态
        if(!$uid){
            exit(json_encode(array('code'=>1,'msg'=>'未登录')));
        }
        //检查库存
        $shop = DB::table('xpcms_shop')->where('id',$shop_id)->myfind();
        if(!$shop){
            exit(json_encode(array('code'=>1,'msg'=>'商品已下架')));
        }
        if($shop['count']<=0){
            exit(json_encode(array('code'=>1,'msg'=>'库存不足')));
        }
        if($shop['count']<$count){
            exit(json_encode(array('code'=>1,'msg'=>'库存不足，仅剩余'.$shop['count'].'件')));
        }
        //下单
        $data['uid'] = $uid;
        $data['order_no'] = $this->createOrderNumber($uid);
        $data['money'] = $shop['price']*$count;
        $data['pro_titles'] = $shop['title'];
        $data['add_time'] = time();
        DB::table('xpcms_order')->insert($data);
        //导入商品销存表
        $sale['order_no'] =  $data['order_no'];
        $sale['pro_id'] = $shop_id;
        $sale['count'] = $count;
        $sale['price'] = $data['money'];
        DB::table('xpcms_order_products')->insert($sale);
        //减库存
        DB::table('xpcms_shop')->where('id',$shop_id)->decrement('count',$count);
        exit(json_encode(array('code'=>0,'msg'=>'下单成功')));
    }
    //生成订单号
    private function createOrderNumber($uid){
        return date('YmdHis').$uid.rand(10000,20000);
    }
}