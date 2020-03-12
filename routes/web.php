<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*Route::get('/', function () {
    return view('welcome');
});*/
/***系统前台路由***/

//登录页面
Route::get('/account/login','Index\Account@login');         //登录页面
Route::get('/account/captcha','Index\Account@captcha');     //验证码
Route::post('/account/dologin','Index\Account@dologin');    //登录功能
Route::get('/account/logout','Index\Account@logout');       //退出功能
Route::get('/account/register','Index\Account@register');   //注册页面
Route::post('/account/logon','Index\Account@logon');        //注册功能

//主页路由
Route::namespace('Index')->middleware(['AuthMember'])->group(function(){
    //主页
    Route::get('/','Home@index');
    //用户资料
    Route::get('/user/index','User@index');                  //用户资料
    Route::post('/user/save','User@save');                   //用户资料
    //笔记系统
    Route::get('/user/note/{id}.html','Notes@index');        //笔记详情页
    Route::post('/user/note/save','Notes@save');             //笔记保存
    Route::get('/user/note/add','Notes@add');                //笔记添加
    Route::get('//user/note/del','Notes@del');               //笔记删除
    //商品
    Route::get('/shop','Shop@index');                        //商品主页
    Route::get('/shop/detail/{shop_id}.html','Shop@detail');      //商品详情页
    Route::post('/shop/buy','Shop@buy');
    //图片上传
    Route::any('/image/note','Image@note');
});

/***系统后台路由***/

// 后台登录
Route::get('/admins/account/login','Admins\Account@login')->name('login');
Route::get('/admins/account/captcha','Admins\Account@captcha');
Route::post('/admins/account/dologin','Admins\Account@dologin');
//退出登录
Route::get('/admins/account/logout','Admins\Account@logout')->middleware('auth');

// 后台管理
Route::namespace('admins')->middleware(['auth','rightsvalidates'])->group(function(){
    // 后台主页
    Route::get('/admins/home/index','Home@index');
    Route::get('/admins/home/welcome','Home@welcome');

    // 网站设置
    Route::get('/admins/site/index','Site@index');
    Route::get('/admins/site/seo','Site@seo');
    Route::get('/admins/site/security','Site@security');
    Route::get('/admins/site/wechat','Site@wechat');
    Route::get('/admins/site/annex','Site@annex');
    Route::get('/admins/site/email','Site@email');
    Route::get('/admins/site/check_gd','Site@check_gd');
    Route::post('/admins/site/save','Site@save');
    Route::post('/admins/site/check_email','Site@check_email');
    //管理员管理
    Route::get('/admins/admin/index','Admin@index');
    Route::get('/admins/admin/add','Admin@add');
    Route::post('/admins/admin/save','Admin@save');
    Route::post('/admins/admin/del','Admin@del');
    //菜单管理
    Route::get('/admins/menus/index','Menus@index');
    Route::get('/admins/menus/add','Menus@add');
    Route::post('/admins/menus/del','Menus@delete');
    Route::post('/admins/menus/save','Menus@save');
    //角色管理
    Route::get('/admins/groups/index','Groups@index');
    Route::get('/admins/groups/add','Groups@add');
    Route::post('/admins/groups/save','Groups@save');
    //内容管理
    Route::get('/admins/content/index','Content@index');
    Route::get('/admins/content/add','Content@add');
    Route::post('/admins/content/save','Content@save');
    Route::post('/admins/content/del','Content@del');
    //分类管理
    Route::get('/admins/category/index','Category@index');
    Route::get('/admins/category/add','Category@add');
    Route::post('/admins/category/save','Category@save');
    //商品管理
    Route::get('/admins/products/index','Products@index');      //商品列表
    Route::get('/admins/products/add','Products@add');          //商品列表编辑
    Route::post('/admins/products/save','Products@save');       //商品编辑保存
    Route::get('/admins/products/orderlists','Products@orderlists');//订单列表
    Route::get('/admins/order/add','Order@add');                    //订单编辑
    Route::post('/admins/order/save','Order@save');                    //订单保存
    //笔记系统管理
    Route::get('/admins/notes/index','Notes@index');
    Route::get('/admins/notes/add','Notes@add');
    Route::post('/admins/notes/del','Notes@del');
    Route::post('/admins/notes/save','Notes@save');
    //用户管理
    Route::get('/admins/users/index','Users@index');
    Route::get('/admins/users/add','Users@add');
    Route::get('/admins/site/user','Site@user'); //用户配置
    Route::post('/admins/users/save','Users@save');
    Route::post('/admins/users/del','Users@del');
    //用户分组
    Route::get('/admins/usergroups/index','Usergroups@index');
    Route::get('/admins/usergroups/add','Usergroups@add');
    Route::post('/admins/usergroups/save','Usergroups@save');
    Route::post('/admins/usergroups/del','Usergroups@del');
    //文件上传
    Route::any('/admins/image/index','Image@index');
    Route::any('/admins/image/shop','Image@shop');
    Route::any('/admins/image/note','Image@note');
    
});
