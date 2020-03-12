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

    <form class="layui-form" style="margin-top:10px;">
        @csrf
        <input type="hidden" name="__keys" value="site_user">
        <div class="_hidden1">
        <div class="layui-form-item">
            <label class="layui-form-label">允许新用户注册：</label>
            <div class="layui-input-block no-margin">
                <input type="radio" name="is_reg" value="1" title="开启" {{isset($values['is_reg']) && $values['is_reg']==1?'checked':''}}>
                <input type="radio" name="is_reg" value="0" title="关闭"" {{isset($values['is_reg']) && $values['is_reg']==0?'checked':''}}>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否验证邮箱：</label>
            <div class="layui-input-block no-margin">
                <input type="radio" name="is_email" value="1" title="开启" {{isset($values['is_email']) && $values['is_email']==1?'checked':''}}>
                <input type="radio" name="is_email" value="0" title="关闭"" {{isset($values['is_email']) && $values['is_email']==0?'checked':''}}>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否开启验证码：</label>
            <div class="layui-input-block no-margin">
                <input type="radio" name="is_verify" value="1" title="开启" {{isset($values['is_verify']) && $values['is_verify']==1?'checked':''}}>
                <input type="radio" name="is_verify" value="0" title="关闭"" {{isset($values['is_verify']) && $values['is_verify']==0?'checked':''}}>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">强制手机短信验证：</label>
            <div class="layui-input-block no-margin">
                <input type="radio" name="is_phone" value="1" title="开启" {{isset($values['is_phone']) && $values['is_phone']==1?'checked':''}}>
                <input type="radio" name="is_phone" value="0" title="关闭"" {{isset($values['is_phone']) && $values['is_phone']==0?'checked':''}}>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">注册是否要审核：</label>
            <div class="layui-input-block no-margin">
                <input type="radio" name="is_reg_verify" value="1" title="开启" {{isset($values['is_reg_verify']) && $values['is_reg_verify']==1?'checked':''}}>
                <input type="radio" name="is_reg_verify" value="0" title="关闭"" {{isset($values['is_reg_verify']) && $values['is_reg_verify']==0?'checked':''}}>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否显示注册协议：</label>
            <div class="layui-input-block no-margin">
                <input type="radio" name="is_agreement" value="1" title="开启" {{isset($values['is_agreement']) && $values['is_agreement']==1?'checked':''}}>
                <input type="radio" name="is_agreement" value="0" title="关闭"" {{isset($values['is_agreement']) && $values['is_agreement']==0?'checked':''}}>
            </div>
        </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">用户注册协议：</label>
                <div class="layui-input-inline no-margin">
                <textarea placeholder="请输入内容" class="layui-textarea" name="user_agreements">{{$values['user_agreements']}}</textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">邮件认证内容：</label>
                <div class="layui-input-inline no-margin">
                <textarea placeholder="请输入内容" class="layui-textarea" name="email_content">{{$values['email_content']}}</textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">密码找回邮件内容：</label>
                <div class="layui-input-inline no-margin">
                <textarea placeholder="请输入内容" class="layui-textarea" name="pwd_content">{{$values['pwd_content']}}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                <button type="button" class="layui-btn" onclick="save()">立即提交</button>
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
</script>
</body>
</html>
      