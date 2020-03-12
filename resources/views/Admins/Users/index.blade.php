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
        <span class="layui-input-block">
            <select name="type" >
                <option value="1" >用户名</option>
            </select>
        </span>
        <div class="layui-input-inline">
            <input type="text" name="wd" placeholder="请输入关键词" class="layui-input" value="{{$wd?$wd:''}}">
        </div>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn layui-btn-normal layui-btn-radius" onclick="search()">搜索</button> 
        </div>
        <button type="button" class="layui-btn layui-btn-sm " onclick="add()">增加</button>
    </div>    
    <table class="layui-table">   
        @csrf
    <thead >
        <tr>
        <th>ID</th>
        <th>用户名</th>
        <th>分组</th>
        <th>添加时间</th>
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
            <td>{{$groups[$item['gid']]['title']}}</td>
            <td>{{$item['add_time']?date('Y-m-d H:m:s',$item['add_time']):''}}</td>
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
    function add(uid){
        layer.open({
        type: 2,
        title: uid>0?'修改用户':'添加用户',
        shadeClose: true,
        shade: 0.3,
        area: ['450px', '580px'],
        content: '/admins/users/add?uid='+uid //iframe的url
        });
    }
    //删除功能
    function del(uid){
        layer.confirm('您确定要删除吗？', {
        btn: ['确定','取消'] //按钮
        }, function(){
            // layer.msg();
            $.post('/admins/users/del',{_token:$('input[name="_token"]').val(),uid:uid},function(res){
                if(res.code>0){
                    layer.msg(res.msg,{icon:2});
                }else{
                    layer.msg(res.msg,{icon:1});
                    setTimeout(function(){window.location.reload();},1000);
                }
            },'json');
        });
    }
    //搜索功能
    function search(){
        var type = $('select[name="type"]').val();
        var wd = $('input[name="wd"]').val();
        window.location.href = '?type='+type+'&wd='+wd;
    }
</script>
</body>
</html>
      