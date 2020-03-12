<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JCCMS系统-{{$note['title']}}</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <style>
        .change_width{
            width:500px;
        }
    </style>
</head>
<body style="padding:15px;">
    <form class="layui-form" >
            @csrf    
            <input type="hidden" id="id" value="{{$note['id']}}">
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left:0px;">
                    <input type="text" id='title' placeholder="请输入标题，不能超过30个汉字" class="layui-input" value="{{$note['title']}}" >
                </div>
            </div>
            <div class="layui-form-item" >
                <div class="lauyi-input-block"  >
                    <textarea placeholder="请输入内容" class="layui-textarea" id='editor' >
                    {{$note['content']}}
                    </textarea>
                </div>
		    </div>
    </form>
          
            <div class="layui-form-item">
                <div class="layui-input-inline">
                <button type="button" class="layui-btn" onclick="save()">立即提交</button>
                </div>
            </div>

    <script src="/static/layui/layui.js"></script>
    <script>
    //layui框架初始化
        layui.use(['table','layer','form','layedit','upload'], function(){
         $ = layui.jquery,
        table = layui.table,
        layer = layui.layer,
        form = layui.form,
        layedit = layui.layedit,
        upload = layui.upload,
        change_height = document.documentElement.clientHeight -200,
        //建立富文本编辑器
        index = layedit.set({
                uploadImage: {
                    url: '/image/note' //接口url
                    ,type: 'post' //默认post
                }
                });
        index =layedit.build('editor',{
            height: change_height,
        });
       
    });
    //保存功能
        function save(){
            var data = new Object();
            data['id'] = $('#id').val();
            data['title'] = $('#title').val();
            data['content'] = layedit.getContent(index);
            data['_token'] = $('input[name="_token"]').val();
            $.post('/user/note/save',data,function(res){
                if(res.code>0){
                    return layer.msg(res.msg);
                }
                layer.msg(res.msg);
                setTimeout(function(){parent.window.location.reload();},100);
            },'json');
        }
    </script>

</body>
</html>