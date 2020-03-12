<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>JCCMS商品详情页-{{$detail['title']}}</title>
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






  <div class="content content-nav-base datails-content">
    
    <div class="data-cont-wrap w1200">
      <div class="crumb">
        <a href="javascript:;">首页</a>
        <span>></span>
        <a href="javascript:;">所有商品</a>
        <span>></span>
        <a href="javascript:;">产品详情</a>
      </div>
      <div class="product-intro layui-clear">
        <div class="preview-wrap">
          <a href="javascript:;"><img src="{{$detail['shop_img']}}" width="400px" height="400px"></a>
        </div>
        <div class="itemInfo-wrap">
          <div class="itemInfo">
            <div class="title">
              <h4>{{$detail['title']}} </h4>
              <span><i class="layui-icon layui-icon-rate-solid"></i>收藏</span>
            </div>
            <div class="summary">
              <p class="reference"><span>参考价</span> <del>￥280.00</del></p>
              <p class="activity"><span>活动价</span><strong class="price"><i>￥</i>{{$detail['price']}}</strong></p>
            </div>
            <div class="choose-attrs">
              <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span><div class="number-cont"><span class="cut btn">-</span><input onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" maxlength="4" type="" name="" value="1" id="count"><span class="add btn">+</span></div></div>
            </div>
            <input type="hidden" name="shop_id" value="{{$detail['id']}}">
            @csrf
            <div class="choose-btns">
              <button class="layui-btn layui-btn-primary purchase-btn" onclick="buy()">立刻购买</button>
              <!-- <button class="layui-btn  layui-btn-danger car-btn"><i class="layui-icon layui-icon-cart-simple"></i>加入购物车</button>   -->
            </div>
          </div>
        </div>
      </div>
      <div class="layui-clear">
        <div class="aside" style="width:372px;">
          <h4>热销推荐</h4>
          <div class="item-list">
            <div class="item">
              <img src="/storage/static/shop/images/kpDcUzhYFxne7GycgARIZiKSVw2NOEnf5njIEXzx.png" style="width:280px;height:280px;">
              <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
            </div>
          </div>
        </div>

        <div class="detail" style="width:828px;">
          <h4>详情</h4>
          <div class="item">
            {!!$detail['content']!!}
          </div>
        </div>


      </div>
    </div>
  </div>
<script type="text/javascript">
  layui.config({
    base: '/static/shop/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','jquery','layer'],function(){
      var mm = layui.mm,$ = layui.$,layer=layui.layer;
      var cur = $('.number-cont input').val();
      $('.number-cont .btn').on('click',function(){
        if($(this).hasClass('add')){
          cur++;
         
        }else{
          if(cur > 1){
            cur--;
          }  
        }
        $('.number-cont input').val(cur);
      })
  });

  function buy(){
        var count = layui.$('#count').val();
        var _token = layui.$('input[name="_token"]').val();
        var shop_id = layui.$('input[name="shop_id"]').val();
        layui.$.post('/shop/buy',{count:count,_token:_token,shop_id:shop_id},function(res){
            if(res.code>0){return layer.msg(res.msg);}
            layer.msg(res.msg);
            setTimeout(function(){pay();},1000);
        },'json');
  }
  function pay(){
        layer.open({
        type: 2,
        title: '付款页面',
        shadeClose: true,
        shade: 0.8,
        area: ['380px', '50%'],
        content: '/shop/pay' //iframe的url
        }); 
  }
</script>


</body>
</html>