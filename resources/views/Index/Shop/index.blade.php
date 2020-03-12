<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>{{$basic['site_title']}}--商品</title>
    <link rel="stylesheet" type="text/css" href="/static/shop/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="/static/shop/layui/css/layui.css">
    <script type="text/javascript" src="/static/shop/layui/layui.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>

<body>

    <div class="site-nav-bg">
        <div class="site-nav w1200">
            <p class="sn-back-home">
                <i class="layui-icon layui-icon-home"></i>
                <a href="#">首页</a>
            </p>
            <div class="sn-quick-menu">
                <div class="login">用户名:{{$admin}}</div>
                <!-- <div class="sp-cart"><a href="shopcart.html">购物车</a></div> -->
            </div>
        </div>
    </div>
    <div class="content content-nav-base commodity-content">
        
        <div class="commod-cont-wrap">
            <div class="commod-cont w1200 layui-clear">
                <div class="left-nav">
                    <div class="title">所有分类</div>
                        <div class="list-box">
                            @foreach($category as $value)
                            <dl>
                                <dt>{{$value['title']}}</dt>
                                @foreach($value['children'] as $val)
                                <dd><a href="javascript:;">{{$val['title']}}</a></dd>
                                @endforeach
                            </dl>
                            @endforeach
                        </div>
                    </div>
                    <div class="right-cont-wrap">
                        <div class="right-cont">
                        
                                <div class="cont-list layui-clear" id="list-cont">
                                    @foreach($shop as $val)
                                        <div class="item" >
                                       
                                                <div class="img">
                                                    <a href="javascript:;"><img src="{{$val['shop_img']}}" width="278px" height="288px;" onclick="shop_detail({{$val['id']}})"></a>
                                                </div>
                                                <div class="text">
                                                    <p class="title"><a href="javascript:;" onclick="shop_detail({{$val['id']}})">{{$val['title']}}</a></p>
                                                    <p class="price">
                                                        <span class="pri">￥{{$val['price']}}</span>
                                                        <span class="nub">库存:{{$val['count']}}</span>
                                                    </p>
                                                </div>
                                        
                                        </div>
                                    @endforeach
                                </div>
                                
                        </div>
        
                    </div>
                </div>
            </div>
    <script>
        layui.config({
            base: '/static/shop/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
        }).use(['mm', 'laypage', 'jquery'], function() {
            var laypage = layui.laypage,
                $ = layui.$,
                mm = layui.mm;

            $('.sort a').on('click', function() {
                $(this).addClass('active').siblings().removeClass('active');
            })
            $('.list-box dt').on('click', function() {
                if ($(this).attr('off')) {
                    $(this).removeClass('active').siblings('dd').show()
                    $(this).attr('off', '')
                } else {
                    $(this).addClass('active').siblings('dd').hide()
                    $(this).attr('off', true)
                }
            });

        });
        function shop_detail(id){
            window.location.href = '/shop/detail/'+id+'.html';
        }
    </script>


</body>

</html>