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
    </div>    
    <table class="layui-table">   
        @csrf
    <thead >
        <tr>
        <th>订单号</th>
        <th>购买用户</th>
        <th>价格</th>
        <th>商品名称</th>
        <th>状态</th>
        <th>下单时间</th>
        <th>操作</th>
        </tr> 
    </thead>
    <tbody>
        @foreach($lists as $item)
        <tr>
            <td>{{$item['order_no']}}</td>
            <td>{{$user[$item['uid']]['username']}}</td>
            <td>{{$item['money']}}</td>
            <td>{{$item['pro_titles']}}</td>
            <td>{{$item['status']==0?'未付款':'已付款'}}</td>
            <td>{{date('Y-m-d H:m:s',$item['add_time'])}}</td>
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
        layer.open({
        type: 2,
        title: '编辑',
        shade: 0.3,
        area: ['380px', '380px'],
        content: '/admins/order/add?id='+id //iframe的url
        }); 
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
</script>
</body>
</html>
      