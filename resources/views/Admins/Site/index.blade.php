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
        .layui-form-label{
            width:200px;
        }
        .layui-input-block{
            display:inline-block;
            width:65%;
        }
        .no-margin{
            margin-left:20px;
        }

    </style>
</head>
<body>
    <div class="lists-title">
        <span>{{$menu_title}}</span>
        <!-- <button type="button" class="layui-btn layui-btn-sm" onclick="add()">增加</button> -->
    </div>    
    <form class="layui-form" style="margin-top:10px;">
        @csrf
        <input type="hidden" name="__keys" value="site_basic">
        <div class="layui-form-item">
             <label class="layui-form-label">网站名称:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="site_title""  placeholder="请输入网站名称" class="layui-input" value="{{$values['site_title']}}">
            </div>
        </div>
        <div class="layui-form-item">
        <label class="layui-form-label">网站LOGO:</label>
             <div class="layui-upload layui-input-block no-margin">
                <button type="button" class="layui-btn" id="file_logo"">上传图片</button>
                <div class="layui-upload-list" >
                    <img class="layui-upload-img" id="file_show" style="width:100px" src="{{$values['site_logo']}}">
                    <p id="demoText"></p>
                </div>
            </div>         
        </div>
        <input type="hidden" name="site_logo" id="site_logo" value="{{$values['site_logo']}}">
        <div class="layui-form-item">
             <label class="layui-form-label">网站域名:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="site_domain"  placeholder="请输入网站域名" class="layui-input" value="{{$values['site_domain']}}">
            </div>
        </div>
         <div class="layui-form-item">
            <label class="layui-form-label">网站开关</label>
            <div class="layui-input-block no-margin">
                <input type="radio" name="site_status" value="1" title="开始" {{isset($values['site_status']) && $values['site_status']==1?'checked':''}}>
                <input type="radio" name="site_status" value="0" title="关闭" {{isset($values['site_status']) && $values['site_status']==0?'checked':''}} >
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">管理员邮箱:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="adminer_email"  placeholder="请输入管理员邮箱" class="layui-input" value="{{$values['adminer_email']}}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">附件状态统计</label>
            <div class="layui-input-block no-margin">
                <input type="radio" name="annex_status" value="1" title="开始" {{isset($values['annex_status']) && $values['annex_status']==1?'checked':''}}>
                <input type="radio" name="annex_status" value="0" title="关闭" {{isset($values['annex_status']) && $values['annex_status']==0?'checked':''}} >
            </div>
        </div>
       
        <div class="layui-form-item">
                <div class="layui-input-block">
                <button type="button" class="layui-btn" onclick="save()">立即提交</button>
                <!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
                </div>
            </div>
    </form>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['table','layer','upload'], function(){
        $ = layui.jquery, 
        table = layui.table,
        upload = layui.upload,
        layer = layui.layer,
        //图片上传
         uploadInst = upload.render({
            elem: '#file_logo'
            ,url: '/admins/image/index' //上传接口
            ,headers: {
                'X-CSRF-TOKEN': $('input[name="_token"]').val(),
            }
            ,accept: 'images'
            ,before: function(obj){
            //预读本地文件示例，不支持ie8
            obj.preview(function(index, file, result){
                $('#file_show').attr('src', result); //图片链接（base64）
            });
            }
            ,done: function(res){
            //如果上传失败
            if(res.code > 0){
                return layer.msg('上传失败');
            }
            //上传成功
                layer.msg(res.msg);
                $('#site_logo').val(res.url);
            }
            ,error: function(){
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function(){
            uploadInst.upload();
            });
            }
        });
    });


    function save(){
        $.post('/admins/site/save',$('form').serialize(),function(res){
            if(res.code>0){
                return layer.msg(res.msg,{icon:2});
            }else{
                layer.msg(res.msg);
                setTimeout(function(){window.location.reload();},1000);
            }
        },'json');
    }
    
    //检测gd
    function check_gd(){
        $.get('/admins/site/check_gd',{},function(res){
            if(res.code>0){
                return layer.msg(res.msg);
            }else{
                layer.msg(res.msg,{icon:1});
            }
        },'json');
    }
</script>
</body>
</html>
      