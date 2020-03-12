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
    <div class="lists-title layui-form">
        <span>{{$menu_title}}</span>
        <button type="button" class="layui-btn layui-btn-sm " onclick="add()">增加</button>
    </div>    
    <table class="layui-table">   
        @csrf
    <thead >
        <tr>
        <th>ID</th>
        <th>分组名称</th>
        <th>允许上传文件大小(KB)</th>
        <th>搜索权限</th>
        <th>自助升级</th>
        <th>允许投稿</th>
        <th>积分</th>
        <th>操作</th>
        </tr> 
    </thead>
    <tbody>
        @foreach($lists as $item)
        <tr>
            <td >{{$item['gid']}}</td>
            <td>{{$item['title']}}</td>
            <td>{{$item['allow_size']}}</td>
            <td>{!!$item['allow_search']==0? '允许':'<span style="color:red;">不允许</span>'!!}</td>
            <td>{!!$item['auto_upgrade']==1? '允许':'<span style="color:red;">不允许</span>'!!}</td>
            <td>{!!$item['allow_pub']==0? '允许':'<span style="color:red;">不允许</span>'!!}</td>
            <td>{!!$item['points']!!}</td>
            <td>             
                <button type="button" class="layui-btn layui-btn-xs layui-btn-normal" onclick="add({{$item['gid']}})">修改</button>
                <button type="button" class="layui-btn layui-btn-xs layui-btn-danger" onclick="del({{$item['gid']}})">删除</button>
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
    function add(gid){
        layer.open({
        type: 2,
        title: gid>0?'修改分组':'添加分组',
        shadeClose: true,
        shade: 0.3,
        area: ['450px', '580px'],
        content: '/admins/usergroups/add?gid='+gid //iframe的url
        });
    }
    //删除功能
    function del(gid){
        layer.confirm('您确定要删除吗？', {
        btn: ['确定','取消'] //按钮
        }, function(){
            // layer.msg();
            $.post('/admins/usergroups/del',{_token:$('input[name="_token"]').val(),gid:gid},function(res){
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
      