<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JCCMS系统-首页</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">JCCMS 系统</div>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
        {{$_admin['username']}}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="javascript:;" onclick="logout()">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
      @foreach($menus as $key => $val)
        <li class="layui-nav-item @if($key == 0) layui-nav-itemed @endif" onclick="menu_load(this)">
          <a class="" href="javascript:;">{{$val['title']}}</a>
          @if(isset($val['children'])&& $val['children'])
          @foreach($val['children'] as $v)
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" controller="{{strtolower($v['controller'])}}" action="{{strtolower($v['action'])}}" onclick="menuFire(this)">{{$v['title']}}</a></dd>
          </dl>
          @endforeach
          @endif
        </li>
        @endforeach
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="height: calc(100vh - 105px);">
    <iframe src="/admins/home/welcome" style="width:100%;height:100%;" name="videoplay" scrolling="auto" frameborder="0"></iframe>
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © 版权 - 底部固定区域
  </div>
</div>
<script src="/static/layui/layui.js"></script>
<script>
//JavaScript代码区域
layui.use(['element','layer'], function(){
   element = layui.elemen,
   $ = layui.jquery;
});
//菜单折叠事件
function menu_load(obj){
  $('.layui-nav li').removeClass('layui-nav-itemed');
  $(obj).addClass('layui-nav-itemed');
}
//菜单点击事件
function menuFire(obj){
    var controller = $(obj).attr('controller');
    var action = $(obj).attr('action');
   $('iframe').attr('src','/admins/'+controller+'/'+action);
}
//账号退出事件
function logout(){
  layer.confirm('您确定退出登录吗？', {
      btn: ['确定','取消'] //按钮
    }, function(res){
      $.get('/admins/account/logout',function(res){
        if(res.code>0){
        layer.msg(res.msg,{icon:2});
        }
        layer.msg(res.msg,{icon:1});
        setTimeout(function(){window.location.href = '/admins/account/login'},1000);
      },'json');
    });
}
</script>
</body>
</html>
      