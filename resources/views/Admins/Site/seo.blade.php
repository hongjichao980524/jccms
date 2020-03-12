<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JCCMS系统-SEO设置</title>
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
    </style>
</head>
<body>
    <div class="lists-title">
        <span>{{$menu_title}}</span>
        <!-- <button type="button" class="layui-btn layui-btn-sm" onclick="add()">增加</button> -->
    </div>    
    <form class="layui-form" style="margin-top:10px;">
        @csrf
        <input type="hidden" name="__keys" value="site_seo">
        <div class="layui-form-item">
             <label class="layui-form-label">网站标题:</label>
            <div class="layui-input-block">
            <input type="text" name="title"  placeholder="请输入网站标题" class="layui-input" value="{{$seo_value['title']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">关键词:</label>
            <div class="layui-input-block">
            <input type="text" name="keywords"  placeholder="请输入关键词" class="layui-input" value="{{$seo_value['keywords']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">网站描述:</label>
            <div class="layui-input-block">
            <input type="text" name="descs"  placeholder="请输入网站描述" class="layui-input" value="{{$seo_value['descs']}}">
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
      