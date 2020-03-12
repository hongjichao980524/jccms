<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JCCMS系统-{{$menu_title}}</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <style>
        .lists-title{
            clear:both;
            padding:5px;
            border-bottom:1px solid #ededed;
            height:30px;
        }
        .lists-title>span{
            float:left;
            line-height:30px;
            font-size:18px;
            margin-left:15px;
        }
        .lists-title>button{
            float:right;
            margin-right:15px;
        }
        .layui-form-label{
            width:200px;
        }
        .layui-input-block{
            display:inline-block;
            width:65%;
        }
        .no-margin{
            margin-left:20px;
        }

    </style>
</head>
<body>
    <div class="lists-title">
        <span>{{$menu_title}}</span>
        <!-- <button type="button" class="layui-btn layui-btn-sm" onclick="add()">增加</button> -->
    </div>    
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="one layui-this">邮件配置</li>
            <li class="two">发送测试</li>
        </ul>
    </div>
    <form class="layui-form" style="margin-top:10px;">
        @csrf
        <input type="hidden" name="__keys" value="site_email">
        <div class="_hidden1">
        <div class="layui-form-item">
            <label class="layui-form-label">邮件发送方式</label>
            <div class="layui-input-block no-margin">
                <input type="radio" name="send_type" value="1" title="SMTP发送" {{isset($values['send_type']) && $values['send_type']==1?'checked':''}}>
                <input type="radio" name="send_type" value="2" title="MAIL模块发送" {{isset($values['send_type']) && $values['send_type']==2?'checked':''}}>
            </div>
        </div>

        <div class="layui-form-item">
             <label class="layui-form-label">邮件服务器:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="server_address""  placeholder="请输入邮件服务器" class="layui-input" value="{{$values['server_address']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">邮件发送端口:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="port""  placeholder="请输入邮件发送端口" class="layui-input" value="{{$values['port']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">发件人地址:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="from_address""  placeholder="请输入发件人地址" class="layui-input" value="{{$values['from_address']}}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">AUTH LOGIN验证:</label>
            <div class="layui-input-block no-margin">
                <input type="radio" name="auth_check" value="1" title="开启" {{isset($values['auth_check']) && $values['auth_check']==1?'checked':''}}>
                <input type="radio" name="auth_check" value="0" title="关闭" {{isset($values['auth_check']) && $values['auth_check']==0?'checked':''}}>
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">用户名:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="check_user""  placeholder="请输入用户名" class="layui-input" value="{{$values['check_user']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">密码:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="check_pwd""  placeholder="请输入密码" class="layui-input" value="{{$values['check_pwd']}}">
            </div>
        </div>
        <div class="layui-form-item">
                <label class="layui-form-label">加密方式</label>
                <div class="layui-input-block no-margin">
                <select name="encryption">
                    <option value="">请选择</option>            
                    <option value="1" {{isset($values['encryption']) && $values['encryption']==1?'selected':''}}>TLS</option>
                    <option value="2" {{isset($values['encryption']) && $values['encryption']==2?'selected':''}}>SSL</option>
                </select>
                </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">发件人名称:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="name""  placeholder="请输入发件人名称" class="layui-input" value="{{$values['name']}}">
            </div>
        </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                <button type="button" class="layui-btn" onclick="save()">立即提交</button>
                <!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
                </div>
            </div>
        </div>
        <div class="_hidden2" style="display:none;">
            <div class="layui-form-item">
                <label class="layui-form-label">测试邮件标题:</label>
                <div class="layui-input-block no-margin">
                <input type="text" name="subject""  placeholder="请输入测试邮件标题" class="layui-input" value="">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">测试邮件内容</label>
                <div class="layui-input-block no-margin">
                <textarea placeholder="请输入内容" class="layui-textarea" name="content"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">收件人邮箱地址:</label>
                <div class="layui-input-block no-margin">
                <input type="text" name="to"  placeholder="请输入收件人邮箱地址" class="layui-input" value="">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                <button type="button" class="layui-btn" onclick="check_email()">测试发送</button>
                </div>
            </div>
        </div>

    </form>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['table','layer','upload'], function(){
        $ = layui.jquery, 
        table = layui.table,
        upload = layui.upload,
        layer = layui.layer;
        //选项卡
        $('.layui-tab-title li').click(function(){
        if($(this).attr('class')!='layui-this'){
            $('.layui-tab-title li').removeClass('layui-this');
            $(this).addClass('layui-this');
            if($(this).attr('class')=='one layui-this'){
                $('._hidden1').css('display','block');
                $('._hidden2').css('display','none');
            }
            if($(this).attr('class')=='two layui-this'){
                $('._hidden2').css("display","block");
                $('._hidden1').css('display','none');
            }
        }
    });
    });
    //保存
    function save(){
        $.post('/admins/site/save',$('form').serialize(),function(res){
            if(res.code>0){
                return layer.msg(res.msg,{icon:2});
            }else{
                layer.msg(res.msg);
                setTimeout(function(){window.location.reload();},1000);
            }
        },'json');
    }
    //测试发送
    function check_email(){
        $.ajax({
            type:"post",
            url:"/admins/site/check_email",
            xhrFields: {withCredentials: true},
            data:$('form').serialize(),
            dataType:'json',
            success:function(res){
                if(res.code>0){return layer.msg(res.msg);}
                layer.msg(res.msg);
            },
            error:function(err){
                return layer.msg('发送失败，请检查配置信息',{icon:2});
            }

        });
    }
</script>
</body>
</html>
      