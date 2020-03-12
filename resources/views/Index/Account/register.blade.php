<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{$basic['site_title']}}--注册</title>
    <link rel="stylesheet" href="/static/css/normalize.css">
    <link rel="stylesheet" href="/static/css/content.css">
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
    <div class="_wrap">
    <div class="_content clearfix">
        <span class="fl"><img src="{{$basic['site_logo']}}" alt=""></span>
    </div>
    </div>
    <div class="_content _register">
        <h2 style="margin-left:100px;color:#333;border-bottom:1px solid #ededed;">注册页面</h2>
        <form class="layui-form" action="" style="margin-left:300px;margin-top:10px;">
            @csrf
                <div class="layui-form-item">
                <label class="layui-form-label">用户名：</label>
                    <div class="layui-input-inline" style="width:250px;">
                        <input type="text" name="username"  placeholder="请输入用户名" class="layui-input">
                    </div>
                </div>
                
                <div class="layui-form-item">
                <label class="layui-form-label">密码：</label>
                    <div class="layui-input-inline" style="width:250px;">
                        <input type="password" name="password"  placeholder="请输入密码" class="layui-input" autocomplete="off">
                    </div>
                </div>
                <div class="layui-form-item">
                <label class="layui-form-label">验证码：</label>
                    <div class="layui-input-inline"style="width:250px;">
                        <input type="text" name="verifycode" id="verifycode" placeholder="请输入验证码" class="layui-input">
                    </div>
                    <div class="layui-inline" >
                        <img src="/account/captcha" id="captcha" style="border: 1px solid #cdcdcd;cursor:pointer;vertical-align: top;" onclick="reload_captcha()">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                    <button type="button" class="layui-btn"  onclick="logon()">注册</button>
                    </div>
                </div>    
        </form>
    </div>

</body>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['layer','form'],function(){
        $ = layui.jquery,
        layer = layui.layer,
        form = layui.form
    });
    //重新加载验证码
    function reload_captcha(){
        $('#captcha').attr('src','/account/captcha?rand='+Math.random());
    }
    //注册功能
    function logon(){
        var username = $('input[name="username"]').val();
        var password = $('input[name="password"]').val();
        var verifycode = $('input[name="verifycode"]').val();
        if(username == ''){
            return layer.msg('用户名不能为空');
        }
        if(password == ''){
            return layer.msg('密码不能为空');
        }
        if(verifycode == ''){
            return layer.msg('验证码不能为空');
        }
        $.post('/account/logon',$('form').serialize(),function(res){
            if(res.code>0){
                return layer.msg(res.msg);
            }else{
                layer.msg(res.msg);
                setTimeout(function(){window.location.href = '/'},1000);
            }
        },'json');
    }
</script>
</html>