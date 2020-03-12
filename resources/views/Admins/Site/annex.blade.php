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
        <input type="hidden" name="__keys" value="site_annex">
        <div class="layui-form-item">
             <label class="layui-form-label">GD库检测:</label>
            <div class="layui-input-block no-margin">
            <button type="button" class="layui-btn" onclick="check_gd()">检测</button>
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">允许上传大小:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="upload_size"  placeholder="请输入允许上传大小" class="layui-input" value="{{$values['upload_size']}}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label ">允许上传类型:</label>  
            <div class="layui-input-block no-margin">  
                <input type="checkbox" name="upload_type[]" lay-skin="primary" title=".JPG" value=".jpg" {{in_array(isset($values['upload_type']) && '.jpg',$values['upload_type'])?'checked':''}}>
                <input type="checkbox" name="upload_type[]" lay-skin="primary" title=".PNG" value=".png" {{in_array(isset($values['upload_type']) && '.png',$values['upload_type'])?'checked':''}}>
                <input type="checkbox" name="upload_type[]" lay-skin="primary" title=".GIF" value=".gif" {{in_array(isset($values['upload_type']) && '.gif',$values['upload_type'])?'checked':''}}>
            </div>
         </div>
         <div class="layui-form-item">
            <label class="layui-form-label">是否开启图片水印</label>
            <div class="layui-input-block no-margin">
                <input type="radio" name="is_watermark" value="1" title="开始" {{isset($values['is_watermark']) && $values['is_watermark']==1?'checked':''}}>
                <input type="radio" name="is_watermark" value="0" title="关闭" {{isset($values['is_watermark']) && $values['is_watermark']==0?'checked':''}} >
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">水印图片最大宽度:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="watermark_width"  placeholder="请输入水印图片最大宽度" class="layui-input" value="{{$values['watermark_width']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label">水印图片最大高度:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="watermark_height"  placeholder="请输入水印图片最大高度" class="layui-input" value="{{$values['watermark_height']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label ">水印图片地址:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="watermark_url"  placeholder="请输入水印图片地址" class="layui-input" value="{{$values['watermark_url']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label ">水印透明度:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="watermark_transparent"  placeholder="请输入水印透明度" class="layui-input" value="{{$values['watermark_transparent']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label ">JPEG水印质量:</label>
            <div class="layui-input-block no-margin">
            <input type="text" name="watermark_quality"  placeholder="请输入JPEG水印质量" class="layui-input" value="{{$values['watermark_quality']}}">
            </div>
        </div>
        <div class="layui-form-item">
             <label class="layui-form-label ">水印位置:</label>
            <div class="layui-input-block no-margin">
            <select name="watermark_position" lay-filter="watermark_position">
		                <option value="0" {{isset($values['watermark_position']) && $values['watermark_position']==0?'selected':''}}>随机位置</option>
		                <option value="1" {{isset($values['watermark_position']) && $values['watermark_position']==1?'selected':''}}>顶部居左</option>
		                <option value="2" {{isset($values['watermark_position']) && $values['watermark_position']==2?'selected':''}}>中部居左</option>
		                <option value="3" {{isset($values['watermark_position']) && $values['watermark_position']==3?'selected':''}}>底部居左</option>
		                <option value="4" {{isset($values['watermark_position']) && $values['watermark_position']==4?'selected':''}}>顶部居右</option>
		                <option value="5" {{isset($values['watermark_position']) && $values['watermark_position']==5?'selected':''}}>中部居右</option>
		                <option value="6" {{isset($values['watermark_position']) && $values['watermark_position']==6?'selected':''}}>底部居右</option>
		    </select>
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
    layui.use(['table','layer'], function(){
        $ = layui.jquery, 
        table = layui.table,
        layer = layui.layer;
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
      