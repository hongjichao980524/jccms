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
        <input type="hidden" name="id" value="{{$cate_value['id']}}">
        <div class="layui-form-item">
             <label class="layui-form-label">分类名:</label>
            <div class="layui-input-inline no-margin">
            <input type="text" name="title" placeholder="请输入分类名" class="layui-input" value="{{$cate_value['title']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">英文别名:</label>
            <div class="layui-input-inline no-margin">
            <input type="text" name="code"  placeholder="请输入英文别名" class="layui-input" value="{{$cate_value['code']}}">
            </div>
        </div>
        <div class="layui-form-item">
                <label class="layui-form-label">选择分类:</label>
                <div class="layui-input-inline no-margin">
                <select name="pid">
                    <option value="">请选择</option>
                    <option value="0" {{$cate_value['pid']==0?'selected':''}}>顶级分类</option>
                    @foreach($category as $cate)
                    <option value="{{$cate['id']}}" {{$cate['id'] == $cate_value['pid']?'selected':''}}>{{$cate['title']}}</option>
                    @endforeach
                </select>
                </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">seo标题:</label>
            <div class="layui-input-inline no-margin">
            <input type="text" name="seo_title"  placeholder="请输入英文别名" class="layui-input" value="{{$cate_value['seo_title']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">keyword:</label>
            <div class="layui-input-inline no-margin">
            <input type="text" name="keyword"  placeholder="请输入英文别名" class="layui-input" value="{{$cate_value['keyword']}}">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">seo摘要:</label>
            <div class="layui-input-inline no-margin" style="width:200px;">
            <textarea placeholder="请输入内容" class="layui-textarea" name="descs" value="{{$cate_value['descs']}}"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
                <div class="layui-input-block">
                <button type="button" class="layui-btn" onclick="save()">立即提交</button>
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
    //保存功能
    function save(){
        $.ajax({
        type:"post",
        dataType:"json",
        url:"/admins/category/save",
        data:$('form').serialize(),
        success:function(res){
            if(res.code>0){
                return layer.msg(res.msg);
            }
            layer.msg(res.msg);
            setTimeout(function(){
                window.location.href='/admins/category/index';
            },1000)
        },
        error:function(){
            layer.msg('保存失败');
        },
    });
    }


</script>
</body>
</html>
      