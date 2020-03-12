<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单编辑</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body style="padding:15px;">
    <form class="layui-form" >
            @csrf
            <input type="hidden" id="id" value="$order['id']">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">价格</label>
                    <div class="layui-input-inline">
                    <input type="text" id='money'' placeholder="请输入新的价格" class="layui-input" value="{{$order['money']}}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-block">
                <input type="radio" name="status" value="0" title="未付款" {{$order['status'] == 0? 'checked':''}}>
                <input type="radio" name="status" value="1" title="已付款" {{$order['status'] == 1? 'checked':''}}>
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
            data.money = $('#money').val();
            data.status = $('input[name="status"]').val();
            if(data.money==''){
                layer.msg('金额不能为空');
                return;
            }
            
            $.post('/admins/order/save',data,function(res){
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