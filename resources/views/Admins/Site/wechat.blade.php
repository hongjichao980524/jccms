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
        <input type="hidden" name="__keys" value="site_wechat">
        <div class="layui-form-item">
             <label class="layui-form-label">AppID:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="AppID"  placeholder="请输入AppID" class="layui-input" value="{{$values['AppID']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">AppSecret:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="AppSecret"  placeholder="请输入AppSecret" class="layui-input" value="{{$values['AppSecret']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">Token:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="Token"  placeholder="请输入Token" class="layui-input" value="{{$values['Token']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label ">EncodingAESKey:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="EncodingAESKey"  placeholder="请输入EncodingAESKey" class="layui-input" value="{{$values['EncodingAESKey']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label ">回调URL:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="url"  placeholder="请输入回调URL" class="layui-input" value="{{$values['url']}}">
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
      