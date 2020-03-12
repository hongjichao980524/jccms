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
        <input type="hidden" name="pid" value="">
        <button type="button" class="layui-btn layui-btn-sm " onclick="menu_parent({{$backid}})">返回上级菜单</button>
        <button type="button" class="layui-btn layui-btn-sm layui-btn-normal" onclick="add()">增加</button>
    </div>    
    <table class="layui-table">   
        @csrf
    <thead >
        <tr>
        <th>ID</th>
        <th>分类名</th>
        <th>seo标题</th>
        <th>seo key</th>
        <th>seo描述</th>
        <th>修改时间</th>
        <th>状态</th>
        <th>操作</th>
        </tr> 
    </thead>
    <tbody>
        @foreach($cate_lists as $item)
        <tr>
            <td >{{$item['id']}}</td>
            <td>{{$item['title']}}</td>
            <td>{{$item['seo_title']}}</td>
            <td>{{$item['keyword']}}</td>
            <td>{{$item['descs']}}</td>
            <td>{{$item['edit_time']}}</td>
            <td>{!!$item['status']==0? '正常':'<span style="color:red;">禁用</span>'!!}</td>
            <td>             
                <button type="button" class="layui-btn layui-btn-xs " onclick="menu_child({{$item['id']}})">子菜单</button>
                <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="add({{$item['id']}})">修改</button>
                <button type="button" class="layui-btn layui-btn-xs layui-btn-danger" onclick="del({{$item['id']}})">删除</button>
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
   function menu_parent(pid){
       window.location.href = '?pid='+pid;
   }
   //添加、编辑功能
   function add(id){
       window.location.href = '/admins/category/add?id='+id;
   }
</script>
</body>
</html>
      