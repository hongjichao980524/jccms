<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JCCMS系统-{{$menu_title}}</title>
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
                <div class="layui-block">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                    <input type="text" id='title' placeholder="请输入标题，不能超过30个汉字" class="layui-input " value="{{$note['title']}}" >
                </div>
            </div>
            <br>
            <div class="layui-form-item">
                <label class="layui-form-label">用户</label>
                <div class="layui-input-inline ">
                <select name="uid">
                    <option value=""></option>
                    @foreach($user as $val)
                    <option value="{{$val['id']}}" {{$val['id']==$note['uid']?'selected':''}}>{{$val['username']}}</option>
                    @endforeach
                </select>
                </div>
            </div>
            
         
                <div class="layui-form-item" >
                <div class="lauyi-input-block"  >
                    <textarea placeholder="请输入内容" class="layui-textarea" id='content' name="contents" >
                    
                    {{$note['content']}}
                    </textarea>
                </div>
                </div>
            </form>
          
            <div class="layui-form-item">
                <div class="layui-input-inline">
                <button type="button" class="layui-btn" onclick="save()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
        change_height = document.documentElement.clientHeight -248,
        //建立富文本编辑器
        index = layedit.set({
                uploadImage: {
                    url: '/admins/image/note' //接口url
                    ,type: 'post' //默认post
                }
                });
        index =layedit.build('content',{
        height: change_height,
        });
    });
    //功能代码
        //管理员保存
        function save(){
            var data = new Object();
            
            data['_token'] = $('input[name="_token"]').val();
            data['id'] = $('#id').val();
            data['title'] = $.trim($('#title').val());
            data['uid'] = $('select[name="uid"]').val();
            data['content'] = layedit.getContent(index);
            if(data['title'] ==  ''){
                return layer.msg('标题不能为空');
            }
            $.post('/admins/notes/save',data,function(res){
                if(res.code>0){
                    return layer.msg(res.msg);
                }else{
                    layer.msg(res.msg);
                    setTimeout(function(){window.location.href = '/admins/notes/index'},1000);
                }
            },'json');
        }
    </script>

</body>
</html>