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
        <button type="button" class="layui-btn layui-btn-sm " onclick="add()">增加</button>
    </div>    
    <table class="layui-table">   
        @csrf
    <thead >
        <tr>
        <th>ID</th>
        <th>角色名称</th>
        <th>操作</th>
        </tr> 
    </thead>
    <tbody>
        @foreach($group_lists as $item)
        <tr>
            <td >{{$item['gid']}}</td>
            <td>{{$item['title']}}</td>
            <td>             
                <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="add({{$item['gid']}})">修改</button>
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

    //添加功能
    function add(group_id){
        layer.open({
        type: 2,
        title: group_id>0?'修改角色':'添加角色',
        shadeClose: true,
        shade: 0.3,
        area: ['600px', '600px'],
        content: '/admins/groups/add?gid='+group_id //iframe的url
        });
    }

</script>
</body>
</html>
      