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
            <input type="hidden" id="id" value="{{$user['id']}}">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                    <input type="text" id='username' placeholder="请输入用户名" class="layui-input" value="{{$user['username']}} "{{$user['id']?'readonly':''}}>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                    <input type="password" id='password' placeholder="请输入密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">分组</label>
                <div class="layui-input-inline">
                <select id="gid">
                    <option value=""></option>
                    @foreach($groups as $val)
                    <option value="{{$val['gid']}}" {{$val['gid']==$user['gid']?'selected':''}}>{{$val['title']}}</option>
                    @endforeach
                </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-block">
                <input type="checkbox" id="status" title="禁用" {{$user['status']==1?'checked':''}}>
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
            data.id = $('#id').val();
            data._token = $('input[name="_token"]').val();
            data.username = $.trim($('#username').val());
            data.password = $.trim($('#password').val());
            data.gid = $('#gid').val();
            data.status = $('#status').is(':checked')? 1 :0;
            if(data.username==''){
                layer.msg('用户名不能为空');
                return;
            }
            if(data.id ==0 &&data.password==''){
                layer.msg('密码不能为空');
                return;
            }
            if(data.gid==0){
                layer.msg('请选择角色');
                return;
            }
            $.post('/admins/users/save',data,function(res){
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