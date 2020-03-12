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
        <input type="hidden" name="__keys" value="set_security">
        <div class="layui-form-item">
             <label class="layui-form-label">后台最大登陆失败次数:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="login_faild"  placeholder="请输入最大次数" class="layui-input" value="{{$values['login_faild']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">每分钟访问次数:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="visit_time"  placeholder="请输入每分钟访问次数" class="layui-input" value="{{$values['visit_time']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">后台访问域名:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="sys_domain"  placeholder="请输入后台访问域名" class="layui-input" value="{{$values['sys_domain']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label ">错误日志预警大小:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="log_size"  placeholder="请输入错误日志预警大小" class="layui-input" value="{{$values['log_size']}}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label ">设置:</label>  
            <div class="layui-input-inline no-margin">  
                <input type="checkbox" name="use_log" lay-skin="primary" title="启用后台操作日志" value="1" {{isset($values['use_log']) && $values['use_log']==1?'checked':''}}>
            </div>
         </div>
        <div class="layui-form-item">
                <div class="layui-input-block">
                <button type="button" class="layui-btn" onclick="save()">立即提交</button>
                <!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
                </div>
            </div>
    </form>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['table','layer'], function(){
        $ = layui.jquery, 
        table = layui.table,
        layer = layui.layer;
    });

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
      