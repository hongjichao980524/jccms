<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JCCMS系统-菜单管理</title>
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
        <input type="hidden" name="pid" value="{{$pid}}">
        <button type="button" class="layui-btn layui-btn-sm " onclick="menu_back({{$backid}})">返回上级菜单</button>
        <button type="button" class="layui-btn layui-btn-sm layui-btn-normal" onclick="add()">增加</button>
    </div>    
    <table class="layui-table">   
        @csrf
    <thead >
        <tr>
        <th>ID</th>
        <th>排序</th>
        <th>菜单名称</th>
        <th>Controller</th>
        <th>action</th>
        <th>是否隐藏</th>
        <th>是否禁用</th>
        <th>操作</th>
        </tr> 
    </thead>
    <tbody>
        @foreach($menu_lists as $item)
        <tr>
            <td >{{$item['mid']}}</td>
            <td>{{$item['ord']}}</td>
            <td>{{$item['title']}}</td>
            <td>{{$item['controller']}}</td>
            <td>{{$item['action']}}</td>
            <td>{!!$item['ishidden']==0? '否':'<span style="color:red;">是</span>'!!}</td>
            <td>{!!$item['status']==0? '否':'<span style="color:red;">是</span>'!!}</td>
            <td>             
                <button type="button" class="layui-btn layui-btn-xs " onclick="menu_child({{$item['mid']}})">子菜单</button>
                <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="add({{$item['mid']}})">修改</button>
                <button type="button" class="layui-btn layui-btn-xs layui-btn-danger" onclick="del({{$item['mid']}})">删除</button>
            </td>
        </tr>
        @endforeach
    </tbody>
    </table>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['table','layer'], function(){
        $ = layui.jquery, 
        table = layui.table,
        layer = layui.layer;
    });
    //下级菜单
    function menu_child(pid){
        window.location.href = '?pid='+pid;
    }
    //返回上级菜单
    function menu_back(backid){
        window.location.href = '?pid='+backid;
    }
    //添加功能
    function add(menu_id){
        var pid = $('input[name="pid"]').val();
        layer.open({
        type: 2,
        title: menu_id>0?'修改菜单':'添加菜单',
        shadeClose: true,
        shade: 0.3,
        area: ['450px', '520px'],
        content: '/admins/menus/add?menu_id='+menu_id+'&pid='+pid //iframe的url
        });
    }
    //删除功能
    function del(menu_id){
        layer.confirm('您确定要删除吗？', {
        btn: ['确定','取消'] //按钮
        }, function(){
            // layer.msg();
            $.post('/admins/menus/del',{_token:$('input[name="_token"]').val(),menu_id:menu_id},function(res){
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
      