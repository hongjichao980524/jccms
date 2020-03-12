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
            height:40px;
        }
        .lists-title>span{
            float:left;
            line-height:40px;
            font-size:18px;
            margin-left:15px;
        }
        .lists-title>button{
            float:right;
            margin-top:5px;
            margin-right:15px;
        }
    </style>
</head>
<body>
    <div class="lists-title layui-form" >
        <span>{{$menu_title}}</span>
        <span class="layui-input-block">
            <select name="username"" >
                <option value="">用户搜索</option>
                @foreach($user as $val)
                <option value="{{$val['id']}}" >{{$val['username']}}</option>
                @endforeach
            </select>
        </span>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-normal layui-btn-radius" onclick="search()">搜索</button> 
        </div>
    </div>    
    <table class="layui-table">   
        @csrf
    <thead >
        <tr>
        <th>ID</th>
        <th>标题</th>
        <th>用户作者</th>
        <th>分组</th>
        <th>修改时间</th>
        <th>操作</th>
        </tr> 
    </thead>
    <tbody>
        @foreach($lists as $item)
        <tr>
            <td>{{$item['id']}}</td>
            <td>{{$item['title']}}</td>
            <td>{{$user[$item['uid']]['username']}}</td>
            <td>{{$item['cid']}}</td>
            <td>{{date('Y-m-d H:m:s',$item['edit_time'])}}</td>
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
    //添加
    function add(id){
        window.location.href = '/admins/notes/add?id='+id;
    }
    //删除
    function del(id){
        layer.confirm('确定要删除吗？', {
        btn: ['确定','取消'] //按钮
        }, function(){
            $.post('/admins/notes/del',{_token:$('input[name="_token"]').val(),id:id},function(res){
                if(res.code>0){
                    return layer.msg(res.msg);
                }else{
                    layer.msg(res.msg);
                    setTimeout(function(){window.location.reload();},1000);
                }
            },'json');
        });
    }
    //搜索
    function search(){
        var uid = $('select[name="username"]').val();
        window.location.href = '?uid='+uid;
    }
</script>
</body>
</html>
      