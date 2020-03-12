<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>菜单管理</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body style="padding:15px;">
    <form class="layui-form" >
            @csrf
            <input type="hidden" id="pid" value="{{$pid}}">
            <input type="hidden" id="mid" value="{{$menu['mid']}}">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">菜单名称</label>
                    <div class="layui-input-inline">
                    <input type="text" id='title' placeholder="请输入菜单名称" class="layui-input" value="{{$menu['title']}}">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">排序</label>
                    <div class="layui-input-inline">
                    <input type="text" id='ord' placeholder="请输入排序" class="layui-input"value="{{$menu['ord']}}">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">Controller</label>
                    <div class="layui-input-inline">
                    <input type="text" id='controller' placeholder="请输入控制器" class="layui-input" value="{{$menu['controller']}}">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">Action</label>
                    <div class="layui-input-inline">
                    <input type="text" id='action' placeholder="请输入方法" class="layui-input" value="{{$menu['action']}}" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-block">
                <input type="checkbox" id="ishidden" title="是否隐藏" {{$menu['ishidden']==1?'echo checked="checked"':''}}>
                <input type="checkbox" id="status" title="是否禁用" {{$menu['status']==1?'checked':''}}>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                <button type="button" class="layui-btn" onclick="save()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
            data.pid = $('#pid').val();
            data.mid = $('#mid').val();
            data._token = $('input[name="_token"]').val();
            data.title = $.trim($('#title').val());
            data.ord = $('#ord').val();
            data.controller = $.trim($('#controller').val());
            data.action = $.trim($('#action').val());
            data.ishidden = $('#ishidden').is(':checked')? 1 :0;
            data.status = $('#status').is(':checked')? 1 :0;
            if(data.title==''){
                layer.msg('菜单名称不能为空');
                return;
            }
            if(data.pid>0 && data.controller==''){
                layer.msg('控制器名称不能为空');
                return;
            }
            if(data.pid>0 && data.action==''){
                layer.msg('方法名称不能为空');
                return;
            }
            $.post('/admins/menus/save',data,function(res){
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