<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JCCMS系统-登录</title>
    <link rel="stylesheet" href="/static/css/normalize.css">
    <!-- 引入layui框架 -->
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <!-- 内部样式 -->
    <style>
        .content{
            background:#fff;
            width:450px;
            height:300px;
            position:absolute;
            left:50%;
            top:50%;
            margin-left:-225px;
            margin-top:-150px;
            border-radius:12px;
            box-shadow:2px 2px 5px #666;
        }
        .content .wrap h2{
            margin:15px 0;
            margin-left:20px;
            color:#666;    
        }
    </style>
</head>
<body style="background:#1E9FFF;">
    
    <div class="content">
    <form class="layui-form" action="">
        @csrf
        <div class="wrap"><h2>JCCMS后台管理系统</h2></div>
            <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" name="username" id="username"  placeholder="请输入用户名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">密&nbsp;&nbsp;码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" id="password" placeholder="请输入密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">验证码</label>
                <div class="layui-input-inline">
                    <input type="text" name="verifycode" id="verifycode" placeholder="请输入密码" class="layui-input">
                </div>
                <div class="layui-inline">
                    <img src="/admins/account/captcha" id="captcha" style="border: 1px solid #cdcdcd;cursor:pointer;" onclick="reload_captcha()">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                <button type="button" class="layui-btn"  onclick="dologin()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>    
    </form>
    </div>

    <script src="/static/layui/layui.js"></script>
    <script>

        layui.use(['form','layer'], function(){
            $ = layui.jquery;
            form = layui.form;
			layer = layui.layer;
            //自动焦点
            $('#username').focus();
            //回车登录
            $('input').keydown(function(e){
                if(e.keyCode==13){
                    dologin();
                }
            });

            });

        //回车登录

        //重新加载验证码
        function reload_captcha(){
            $('#captcha').attr('src','/admins/account/captcha?rand='+Math.random());
        }

        //登录功能
        function dologin(){
            var username = $.trim($('#username').val());            
            var password = $.trim($('#password').val());
            var verifycode = $.trim($('#verifycode').val());
            var token = $('input[name="_token"]').val();
            if(username == ''){
				layer.alert('请填写用户名',{icon:2});
				return;
               
			}
			if(password == ''){
				layer.alert('请填写密码',{icon:2});
				return;
			}
			if(verifycode ==''){
				layer.alert('请填写验证码',{icon:2});
				return;
			}

            $.post('/admins/account/dologin',{_token:token,'username':username,'password':password,'verifycode':verifycode},
            function(res){
                if(res.code>0){
                    layer.msg(res.msg,{icon:2});
                    reload_captcha();
                }else{
                    layer.msg(res.msg,{icon:1});
                    setTimeout(function(){
                        window.location.href = '/admins/home/index';
                    }, 1000)
                }
            },'json');

        }
    </script>
</body>
</html>