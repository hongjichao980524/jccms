<?php

namespace App\Http\Controllers\Admins;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Config;
/**
 * 后台网站设置管理
 */
class Site extends Controller
{
    //网页设置
    public function index(Request $req){
        $data['menu_title'] = $req->admin->menu_title;
        $res = DB::table('xpcms_sys_setting')->where('keys','site_basic')->myfind();
        $data['values'] = json_decode($res['values'],true);
        return view('Admins.Site.index',$data);
    }
    //用户配置
    public function user(Request $req){
        $data['menu_title'] = $req->admin->menu_title;
        $res = DB::table('xpcms_sys_setting')->where('keys','site_user')->myfind();
        $data['values'] = json_decode($res['values'],true);
        return view('Admins.Site.user',$data);
    }
    // SEO设置
    public function seo(Request $req){
        $data['menu_title'] = $req->admin->menu_title;
        $res = DB::table('xpcms_sys_setting')->where('keys','site_seo')->myfind();
        $data['seo_value'] = json_decode($res['values'],true);
        return view('Admins.Site.seo',$data);
    }
    //安全设置
    public function security(Request $req){
        $data['menu_title'] = $req->admin->menu_title;
        $res = DB::table('xpcms_sys_setting')->where('keys','set_security')->myfind();
        $data['values'] = json_decode($res['values'],true);
        return view('Admins.Site.security',$data);
    }
    //微信公众号配置
    public function wechat(Request $req){
        $data['menu_title'] = $req->admin->menu_title;
        $res = DB::table('xpcms_sys_setting')->where('keys','site_wechat')->myfind();
        $data['values'] = json_decode($res['values'],true);
        return view('Admins.Site.wechat',$data);
    }
    //附件配置
    public function annex(Request $req){
        $data['menu_title'] = $req->admin->menu_title;
        $res = DB::table('xpcms_sys_setting')->where('keys','site_annex')->myfind();
        $data['values'] = json_decode($res['values'],true);
        return view('Admins.Site.annex',$data);
    }
    //邮箱配信
    public function email(Request $req){
        $res = DB::table('xpcms_sys_setting')->where('keys','site_email')->myfind();
        $data['menu_title'] = $req->admin->menu_title;
        $data['values'] = json_decode($res['values'],true);
        return view('Admins.Site.email',$data);
    }
    //GD检测
    public function check_gd(){
        if(function_exists('gd_info')){
            $gd_info =@gd_info();
            $msg = '<!--<font color="red">√</font> -->GD库已开启<br/>版本为：'.$gd_info["GD Version"];
            $code = 0;
        }else{
            $msg = '<!--<font color="red">×</font> -->GD库未开启';
	    	$code = 1;
        }
        exit(json_encode(array('code'=>$code,'msg'=>$msg)));
    }
    //测试邮箱
    public function check_email(Request $req){
        $send_type = [1=>'SMTP',2=>'MAIL'];
        $encryption = [1=>'TLS',2=>'SSL'];
        if(!isset($send_type[$req->send_type])){
            exit(json_encode(array('code'=>1,'msg'=>'请选择邮件发送模式')));
        }
        if($req->send_type != 1){
            exit(json_encode(array('code'=>1,'msg'=>'当前支持SMTP模式')));
        }   
        if(!isset($send_type[$req->send_type])){
            exit(json_encode(array('code'=>1,'msg'=>'请选择邮件发送模式')));
        }
        if(!$req->server_address){
			exit(json_encode(array('code'=>1,'msg'=>'邮件服务器不能为空')));
		}
		if(!$req->port){
			exit(json_encode(array('code'=>1,'msg'=>'请输入邮件发送端口号')));
		}
		if(!isset($encryption[$req->encryption])){
			exit(json_encode(array('code'=>1,'msg'=>'请选择加密方式')));
		}
		if(!$req->check_user){
			exit(json_encode(array('code'=>1,'msg'=>'请输入用户名')));
		}
		if(!$req->check_pwd){
			exit(json_encode(array('code'=>1,'msg'=>'请输入密码')));
		}
		if(!$req->name){
			exit(json_encode(array('code'=>1,'msg'=>'请输入发件人名称')));
		}
		if(!$req->from_address){
			exit(json_encode(array('code'=>1,'msg'=>'请输入发件人地址')));
		}
		if(!$req->subject){
			exit(json_encode(array('code'=>1,'msg'=>'请输入邮件标题')));
		}
		if(!$req->content){
			exit(json_encode(array('code'=>1,'msg'=>'请输入邮件内容')));
		}
		if(!$req->to){
			exit(json_encode(array('code'=>1,'msg'=>'请输入收件人地址')));
        }
        //邮件发送模式
        Config::set('mail.driver',$send_type[$req->send_type]);
        //邮件服务器
        Config::set('mail.host',$req->server_address);
        //端口号
        Config::set('mail.port',$req->port);
        //加密方式
        Config::set('mail.encryption',$encryption[$req->encryption]);
        //用户名
        Config::set('mail.username',$req->check_user);
        //密码
        Config::set('mail.password',$req->check_pwd);
        //发件人
        Config::set('mail.from.name',$req->name);
        //发件人邮箱地址
        Config::set('mail.from.address',$req->from_address);
        //测试标题
        $this->subject = $req->subject;
        //测试收件人邮箱
        $this->to = $req->to;
        //测试邮件内容
        $this->content = $req->content;
        //发送
        Mail::raw($this->content,function($message){
            $message->to($this->to)->subject($this->subject);
        });
        //判断 返回的一个错误数组，利用此可以判断是否发送成功
        if(count(Mail::failures())<1){
            exit(json_encode(array('code'=>0,'msg'=>'邮件发送成功，请查收！')));
        }else{
            exit(json_encode(array('code'=>1,'msg'=>'邮件发送失败，请检查后重试！')));
        }
    }
    //保存功能
    public function save(Request $req){
        
        $data = $req->all();
        $keys = $data['__keys'];
        unset($data['_token']);
        unset($data['__keys']);
        $res = DB::table('xpcms_sys_setting')->where('keys',$keys)->myfind();
        if($res){
            DB::table('xpcms_sys_setting')->where('keys',$keys)->update(array('values'=>json_encode($data)));
        }else{
            DB::table('xpcms_sys_setting')->insert(array('keys'=>$keys,'values'=>json_encode($data)));
        }
        exit(json_encode(array('code'=>0,'msg'=>'操作成功')));
    }
}
