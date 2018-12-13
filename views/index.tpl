<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>电影赏析</title>
  <link rel="stylesheet" type="text/css" href="../static/res/layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="../static/res/css/main.css">
<!--加载meta IE兼容文件-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
</head>
<body>
  <div class="header">
    <div class="menu-btn">
      <div class="menu"></div>
    </div>
    <h1 class="logo">
      <a href="index.html">
        <span>Golang</span>
        <img src="../static/res/img/logo.png">
      </a>
    </h1>
    <div class="nav">
      <a href="index.html" class="active">电影资讯</a>
      <a href="leacots.html">微语</a>
      <a href="album.html">相册</a>
      <a href="about.html">about me</a>
    </div>
    <ul class="layui-nav header-down-nav">
      <li class="layui-nav-item"><a href="index.html" class="active">电影资讯</a></li>
      <li class="layui-nav-item"><a href="leacots.html">微语</a></li>
      <li class="layui-nav-item"><a href="album.html">相册</a></li>
      <li class="layui-nav-item"><a href="about.html">about me</a></li>
    </ul>
    <p class="welcome-text">
      欢迎来到<span class="name">frank</span>的电影空间~
    </p>
  </div>

  <div class="content">
    <div class="cont w1000">
      <div class="list-item">
      {{range $ind, $elem := .Movies}}
        <div class="item">
          <div class="layui-fluid">
            <div class="layui-row">
              <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                <div class="img"><img src="{{$elem.image}}" alt="" height="500px"></div>
              </div>
              <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                <div class="item-cont">
                  <h3>{{$elem.title}}<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                  <h5>豆瓣评分：{{$elem.rating}}</h5>
                  <p>{{$elem.summary}}</p>
                  <a href="detail.html?id={{$elem.id}}" class="go-icon"></a>
                </div>
            </div>
            </div>
           </div>
        </div>
       {{end}}  
      </div>
      <div id="page" style="text-align: center;"></div>
    </div>
  </div>

  <div class="footer-wrap">
    <div class="footer w1000">
      <div class="qrcode">
        <img src="../static/res/img/erweima.jpg">
      </div>
      <div class="practice-mode">
        <img src="../static/res/img/down_img.jpg">
        <div class="text">
          <h4 class="title">我的联系方式</h4>
          <p>微信<span class="WeChat">1234567890</span></p>
          <p>手机<span class="iphone">1234567890</span></p>
          <p>邮箱<span class="email">1234567890@qq.com</span></p>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="../static/res/layui/layui.js"></script>
  <script type="text/javascript">

    layui.config({
      base: '../static/res/js/util/'
    }).use(['element','laypage','jquery','menu'],function(){
      element = layui.element,laypage = layui.laypage,$ = layui.$,menu = layui.menu;
      laypage.render({
        elem: 'page'
        ,count: {{.Count}} //数据总数，从服务端得到
        ,limit: 5
        ,curr:{{.Page}}
        ,jump:function(data, first){
            var page = data.curr;
            $("#currPage").val(page);
            var limt = data.limit;
            $("#limit").val(limt);
            if(!first){ //点击右下角分页时调用
                window.location.href="/index?page="+page;
            }
        }
      });
      menu.init();
    })

  </script>
</body>
</html>
