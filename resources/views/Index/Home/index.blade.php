<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{$basic['site_title']}}--首页</title>
    <link rel="stylesheet" href="/static/css/normalize.css">
    <link rel="stylesheet" href="/static/css/content.css">
    <link rel="stylesheet" href="/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/font/iconfont.css">
</head>
<body>
    <div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><img src="{{$basic['site_logo']}}" style="width:100px;" alt=""></div>
        <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
            用户：{{$admin['username']}}
            </a>
            <dl class="layui-nav-child">
            <dd><a href="javascript:;" onclick="userdata({{$admin['id']}})">基本资料</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="javascript:;" onclick="logout()">退了</a></li>
        </ul>
    </div>
    <div class="jc-content clerfix">
        <div class="jc-content-left fl">
            <div class="newAdd" style="">
                <a href="javascript:;" onclick="newAdd()"><i class="iconfont icon-newAdd"></i>新增笔记</a>
            </div>
        <ul>
            @foreach($notes as $item)
<li>
    
    <a href="javascript:;" onclick="notes({{$item['id']}})"><i class="iconfont icon-biji"></i>{{$item['title']}}</a>
    <p>
        <span><i class="iconfont icon-shijian"></i>{{date('Y-m-d H:m:s',$item['edit_time'])}}</span>
        <span><a href="javascript:;" onclick="del({{$item['id']}})">删除</a></span>
    </p>
</li>
            @endforeach
        </ul>
        </div>
        <div class="jc-content-right fl">
        <iframe src="/user/note/{{$notes[0]['id']}}.html" style="width:100%;height:100%;" name="videoplay" scrolling="auto" frameborder="0"></iframe>
        </div>
    </div>
</div>
</body>
<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['layer','element'],function(){
        $ = layui.jquery,
        layer = layui.layer,
        element = layui.element;
        $("li").click(function(){
            $(this).siblings().removeClass("active");
            $(this).addClass("active");
        });     
    });
            
    function logout(){
        layer.confirm('确定要退出登录吗', {
        btn: ['确定','取消'] //按钮
        }, function(res){
        $.get('/account/logout',function(res){
            if(res.code>0){
                return layer.msg(res.msg);
            }else{
                layer.msg(res.msg);
                setTimeout(function(){window.location.href = '/account/login'},1000);
            }
        },'json');
        });
    }
    function userdata(uid){
        layer.open({
            type: 2,
            title: '编辑个人资料',
            shade: 0.3,
            area: ['420px', '300px'],
            content: '/user/index?uid='+uid //iframe的url
            }); 
    }
    function notes(id){
        $('iframe').attr('src','/user/note/'+id+'.html');
    }
    function newAdd(){
        $.get('/user/note/add',function(res){
            if(res.code>0){
                return layer.msg(res.msg);
            }else{
                setTimeout(function(){window.location.reload()},50);
            }
        },'json');
    }
    function del(note_id){
        layer.confirm('确定删除吗', {
            btn: ['确定','取消'] //按钮
            }, function(){
                $.get('/user/note/del?note_id='+note_id,function(res){
                    if(res.code>0){
                        return layer.msg(res.msg);
                    }else{
                        layer.msg(res.msg);
                        setTimeout(function(){window.location.reload();},500);
                    }
                });
            });
    }
</script>
</html>