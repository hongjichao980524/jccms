<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{$menu_title}}</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body style="padding:15px;">
    <form class="layui-form" >
            @csrf
            <input type="hidden" id="gid" value="{{$group['gid']}}">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">分组名</label>
                    <div class="layui-input-inline">
                    <input type="text" id='title' placeholder="请输入分组名" class="layui-input" value="{{$group['title']}} ">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">积分</label>
                    <div class="layui-input-inline">
                    <input type="text" id='points' placeholder="请输入积分" class="layui-input" value="{{$group['points']}}">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">允许上传文件大小</label>
                    <div class="layui-input-inline">
                    <input type="text" id='allow_size' placeholder="请输入允许上传文件大小" class="layui-input" value="{{$group['allow_size']}}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">权限</label>
                <div class="layui-input-block">
                <input type="checkbox" id="allow_search" lay-skin="primary" title="搜索权限" {{$group['allow_search']==0?'checked':''}}>
                <input type="checkbox" id="auto_upgrade" lay-skin="primary" title="自助升级" {{$group['auto_upgrade']==1?'checked':''}}>
                <input type="checkbox" id="allow_pub" lay-skin="primary" title="允许投稿" {{$group['allow_pub']==0?'checked':''}}>
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
    //layui框架初始化
        layui.use(['table','layer','form'], function(){
         $ = layui.jquery,
        table = layui.table,
        layer = layui.layer,
        form = layui.form;
    });
    //功能代码
        //管理员保存
        function save(){
            var data = new Object();
            data.gid = $('#gid').val();
            data._token = $('input[name="_token"]').val();
            data.title = $.trim($('#title').val());
            data.points = $.trim($('#points').val());
            data.allow_size = $.trim($('#allow_size').val());
            data.allow_search = $('#allow_search').is(':checked')? 0 :1;
            data.auto_upgrade = $('#auto_upgrade').is(':checked')? 1 :0;
            data.allow_pub = $('#allow_pub').is(':checked')? 0 :1;
            if(data.title==''){
                layer.msg('分组名不能为空');
                return;
            }
            $.post('/admins/usergroups/save',data,function(res){
                if(res.code>0){
                    layer.msg(res.msg,{icon:2});
                }else{
                    layer.msg(res.msg,{icon:1});
                    setTimeout(function(){parent.window.location.reload();},1000);
                }
            },'json');
        }
        
    </script>

</body>
</html>