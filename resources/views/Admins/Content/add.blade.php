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
            <input type="hidden" name="id" value="{{$article['id']}}">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-inline">
                    <input type="text" name='title' placeholder="请输入标题，不能超过30个汉字" class="layui-input change_width" value="{{$article['title']}}" >
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">副标题</label>
                    <div class="layui-input-inline">
                    <input type="text" name='subtitle' placeholder="请输入副标题，不能超过30个汉字" class="layui-input change_width" value="{{$article['subtitle']}}">
                </div>
            </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">分类</label>
                <div class="layui-input-inline ">
                <select name="cate_id">
                    <option value=""></option>
                    @foreach($category as $cate)
                    <option value="{{$cate['id']}}" {{$cate['id']==$article['cate_id']?'selected':''}}>{{$cate['title']}}</option>
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
                            <img class="layui-upload-img" id="file_show" style="width:100px;height:100px;" src="{{$article['cover_img']}}">
                            <p id="demoText"></p>
                        </div>
                    </div> 
                </div>
                <input type="hidden" name="cover_img" value="{{$article['cover_img']}}" id="cover_img">
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">SEO标题</label>
                    <div class="layui-input-inline">
                    <input type="text" name='seo_title' placeholder="请输入SEO标题" class="layui-input change_width" value="{{$article['seo_title']}}">
                </div>
            </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">keyWords</label>
                    <div class="layui-input-inline">
                    <input type="text" name='keyword' placeholder="请输入keyWords" class="layui-input change_width" value="{{$article['keyword']}}">
                </div>
            </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">文章摘要</label>
                    <div class="layui-input-inline">
                    <input type="text" name='descs' placeholder="请输入文章摘要" class="layui-input change_width" value="{{$article['descs']}}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">作者</label>
                    <div class="layui-input-inline">
                    <input type="text" name='author' placeholder="请输入作者，不能超过10个汉字" class="layui-input change_width" value="{{$article['author']}}">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">来源</label>
                    <div class="layui-input-inline">
                    <input type="text" name='from_url' placeholder="请输入来源" class="layui-input change_width" value="{{$article['from_url']}}">
                </div>
            </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">评论</label>
                <div class="layui-input-block">
                <input type="radio" name="is_comment" value="1" title="开启" {{$article['is_comment']==1?'checked':''}}>
                <input type="radio" name="is_comment" value="0" title="关闭" {{$article['is_comment']==0?'checked':''}}>
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-block">
                <input type="radio" name="status" value="1" title="开启" {{$article['status']==1?'checked':''}}>
                <input type="radio" name="status" value="0" title="关闭" {{$article['status']==0?'checked':''}}>
                </div>
            </div>
            </div>
            </div>
            <div style="float:right;">
                <div class="layui-form-item" >
                <div class="lauyi-input-block"  >
                    <textarea placeholder="请输入内容" class="layui-textarea" id='content' name="contents" >
                    
                    {{$article['contents']['contents']}}
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
                    url: '/admins/image/index' //接口url
                    ,type: 'post' //默认post
                }
                });
        index =layedit.build('content',{
        height: change_height,
        });
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#file_upload'
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
                $('#cover_img').val(res.url);
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
            data['keyword'] = $.trim($('input[name="keyword"]').val());
            data['descs'] = $.trim($('input[name="descs"]').val());
            data['author'] = $.trim($('input[name="author"]').val());
            data['from_url'] = $.trim($('input[name="from_url"]').val());
            data['status'] = $('input[name="status"]').val();
            data['is_comment'] = $('input[name="is_comment"]').val();
            data['contents'] = layedit.getContent(index);
            data['cover_img'] = $('input[name="cover_img"]').val();
            if(data['title'] ==  ''){
                return layer.msg('标题不能为空');
            }
            if(data['cate_id']== ''){
                return layer.msg('请选择分类');
            }
            if(data['title'].length >30){
                return layer.msg('标题不能超过30个汉字');
            }
            if(data['subtitle'].length >30){
                return layer.msg('副标题不能超过30个汉字');
            }
            if(data['author'].length >10){
                return layer.msg('作者不能超过10个汉字');
            }
            $.post('/admins/content/save',data,function(res){
                if(res.code>0){
                    return layer.msg(res.msg);
                }else{
                    layer.msg(res.msg);
                    setTimeout(function(){window.location.href = '/admins/content/index'},1000);
                }
            },'json');
        }
    </script>

</body>
</html>