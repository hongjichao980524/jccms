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
    </style>
</head>
<body>
    <div class="lists-title">
        <span>{{$menu_title}}</span>
        <button type="button" class="layui-btn layui-btn-sm " onclick="add()">增加</button>
    </div>    
    <table class="layui-table">   
        @csrf
    <thead >
        <tr>
        <th>ID</th>
        <th>用户名</th>
        <th>真实姓名</th>
        <th>分组</th>
        <th>最后登录时间</th>
        <th>状态</th>
        <th>操作</th>
        </tr> 
    </thead>
    <tbody>
        @foreach($lists as $item)
        <tr>
            <td >{{$item['id']}}</td>
            <td>{{$item['username']}}</td>
            <td>{{$item['real_name']}}</td>
            <td>{{$groups[$item['group_id']]['title']}}</td>
            <td>{{$item['login_lasttime']?date('Y-m-d H:m:s',$item['login_lasttime']):''}}</td>
            <td>{!!$item['status']==0? '正常':'<span style="color:red;">禁用</span>'!!}</td>
            <td>             
                <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="add({{$item['id']}})">修改</button>
                <button type="button" class="layui-btn layui-btn-xs layui-btn-danger" onclick="del({{$item['id']}})">删除</button>
            </td>
        </tr>
        @endforeach
    </tbody>
    </table>
    {{$links}}
<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['table','layer'], function(){
        $ = layui.jquery, 
        table = layui.table,
        layer = layui.layer;
    });
    //添加功能
    function add(admin_id){
        layer.open({
        type: 2,
        title: admin_id>0?'修改管理员':'添加管理员',
        shadeClose: true,
        shade: 0.3,
        area: ['450px', '580px'],
        content: '/admins/admin/add?admin_id='+admin_id //iframe的url
        });
    }
    //删除功能
    function del(admin_id){
        layer.confirm('您确定要删除吗？', {
        btn: ['确定','取消'] //按钮
        }, function(){
            // layer.msg();
            $.post('/admins/admin/del',{_token:$('input[name="_token"]').val(),admin_id:admin_id},function(res){
                if(res.code>0){
                    layer.msg(res.msg,{icon:2});
                }else{
                    layer.msg(res.msg,{icon:1});
                    setTimeout(function(){window.location.reload();},1000);
                }
            },'json');
        });
    }
</script>
</body>
</html>
      