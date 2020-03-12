<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JCCMS系统-{{$menu_title}}</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <style>
        .change_width{
            width:500px;
        }
    </style>
</head>
<body style="padding:15px;">
    <form class="layui-form" >
            <div style="float:left;width:600px;">
            @csrf
            <input type="hidden" name="id" value="{{$shop_detail['id']}}">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-inline">
                    <input type="text" name='title' placeholder="请输入标题，不能超过30个汉字" class="layui-input change_width" value="{{$shop_detail['title']}}" >
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">副标题</label>
                    <div class="layui-input-inline">
                    <input type="text" name='subtitle' placeholder="请输入副标题，不能超过30个汉字" class="layui-input change_width" value="{{$shop_detail['subtitle']}}">
                </div>
            </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">分类</label>
                <div class="layui-input-inline ">
                <select name="cate_id">
                    <option value=""></option>
                    @foreach($category as $cate)
                    <option value="{{$cate['id']}}" {{$cate['id']==$shop_detail['cate_id']?'selected':''}}>{{$cate['title']}}</option>
                    @endforeach
                </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">封面图</label>
                <div class="layui-input-inline ">
                    <div class="layui-upload">
                        <button type="button" class="layui-btn" id="file_upload">上传图片</button>
                        <div class="layui-upload-list layui-input-inline ">
                            <img class="layui-upload-img" id="file_show" style="width:100px;height:100px;" src="{{$shop_detail['shop_img']}}">
                            <p id="demoText"></p>
                        </div>
                    </div> 
                </div>
                <input type="hidden" name="shop_img" value="{{$shop_detail['shop_img']}}" id="shop_img">
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">SEO标题</label>
                    <div class="layui-input-inline">
                    <input type="text" name='seo_title' placeholder="请输入SEO标题" class="layui-input change_width" value="{{$shop_detail['seo_title']}}">
                </div>
            </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">keyWords</label>
                    <div class="layui-input-inline">
                    <input type="text" name='keywords' placeholder="请输入keyWords" class="layui-input change_width" value="{{$shop_detail['keywords']}}">
                </div>
            </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">价格</label>
                    <div class="layui-input-inline">
                    <input type="text" name='price' placeholder="请输入价格" class="layui-input change_width" value="{{$shop_detail['price']}}">
                    </div>
                </div>
            </div> 
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">库存</label>
                    <div class="layui-input-inline">
                    <input type="text" name='count' placeholder="请输入库存数量" class="layui-input change_width" value="{{$shop_detail['count']}}">
                    </div>
                </div>
            </div>   
            <div class="layui-form-item">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-block">
                <input type="radio" name="status" value="0" title="开启" {{$shop_detail['status']==0?'checked':''}}>
                <input type="radio" name="status" value="1" title="关闭" {{$shop_detail['status']==1?'checked':''}}>
                </div>
            </div>
            </div>
            </div>
            <div style="float:right;">
                <div class="layui-form-item" >
                <div class="lauyi-input-block"  >
                    <textarea placeholder="请输入内容" class="layui-textarea" id='content' name="contents" >
                    {{$shop_detail['content']['content']}}
                    </textarea>
                </div>
                </div>
		    </div>
            </form>
          
            <div class="layui-form-item">
                <div class="layui-input-inline">
                <button type="button" class="layui-btn" onclick="save()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>

    <script src="/static/layui/layui.js"></script>
    <script>
    //layui框架初始化
        layui.use(['table','layer','form','layedit','upload'], function(){
         $ = layui.jquery,
        table = layui.table,
        layer = layui.layer,
        form = layui.form,
        layedit = layui.layedit,
        upload = layui.upload,
        change_height = document.documentElement.clientHeight -100,
        //建立富文本编辑器
        index = layedit.set({
                uploadImage: {
                    url: '/admins/image/shop' //接口url
                    ,type: 'post' //默认post
                }
                });
        index =layedit.build('content',{
        height: change_height,
        });
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#file_upload'
            ,url: '/admins/image/shop' //上传接口
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
                $('#shop_img').val(res.url);
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
    //功能代码
        //管理员保存
        function save(){
            var data = new Object();
            data['id'] = $('input[name="id"]').val();
            data['_token'] = $('input[name="_token"]').val();
            data['title'] = $.trim($('input[name="title"]').val());
            data['subtitle'] = $.trim($('input[name="subtitle"]').val());
            data['cate_id'] = $('select[name="cate_id"]').val();
            data['seo_title'] = $.trim($('input[name="seo_title"]').val());
            data['keywords'] = $.trim($('input[name="keywords"]').val());
            data['price'] = $.trim($('input[name="price"]').val());
            data['count'] = $('input[name="count"]').val();
            data['status'] = $('input[name="status"]').val();
            data['contents'] = layedit.getContent(index);
            data['shop_img'] = $('input[name="shop_img"]').val();
            if(data['title'] ==  ''){
                return layer.msg('标题不能为空');
            }
            if(data['cate_id']== ''){
                return layer.msg('请选择分类');
            }
            if(data['price']== ''){
                return layer.msg('请填写商品价格');
            }
            if(data['title'].length >30){
                return layer.msg('标题不能超过30个汉字');
            }
            if(data['subtitle'].length >30){
                return layer.msg('副标题不能超过30个汉字');
            }
            $.post('/admins/products/save',data,function(res){
                if(res.code>0){
                    return layer.msg(res.url);
                }else{
                    layer.msg(res.msg);
                    setTimeout(function(){window.location.href = '/admins/products/index'},1000);
                }
            },'json');
        }
    </script>

</body>
</html>