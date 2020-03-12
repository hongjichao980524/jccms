<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>角色管理</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body style="padding:15px;">
    <form class="layui-form" >
            @csrf
            <input type="hidden" name="gid" value="{{$role['gid']}}">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-inline">
                    <input type="text" name='title' placeholder="请输入菜单名称" class="layui-input" value="{{$role['title']}}">
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">权限</label>
                @foreach($menus as $menu)
                <div class="layui-input-block">
                    <input type="checkbox" name="menu[{{$menu['mid']}}]" lay-skin="primary" title="{{$menu['title']}}" {{$role['rights'] && in_array($menu['mid'],$role['rights'])?'checked':''}}>
                </div>

                @if($menu['children'])

                <div class="layui-input-block">  
                    @foreach($menu['children'] as $val)
                    <input type="checkbox" name="menu[{{$val['mid']}}]" lay-skin="primary" title="{{$val['title']}}" {{$role['rights'] && in_array($val['mid'],$role['rights'])?'checked':''}}>
                    @endforeach
                </div>
                <hr>
                @endif
                @endforeach
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
    //保存功能
    function save(){
        var title = $.trim($('input[name="title"]').val());
        if(title==''){
            return layer.msg('角色名称不能为空',{icon:2});
        }
        $.post('/admins/groups/save',$('form').serialize(),function(res){
            if(res.code>0){
                return layer.msg(res.msg,{icon:2});
            }else{
                layer.msg(res.msg);
                setTimeout(function(){parent.window.location.reload();},1000);
            }
        },'json');
    }
    </script>

</body>
</html>