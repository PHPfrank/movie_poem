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

  <div class="about-content">
    <div class="w1000">
      <div class="item info">
        <div class="title">
          <h3>我的介绍</h3>
        </div>
        <div class="cont">
          <img src="../static/res/img/xc_img1.jpg">
          <div class="per-info">
            <p>
              <span class="name">Frank</span><br />
              <span class="age">25岁</span><br />
              <span class="Career">后端工程师，兼职前端萌新</span><br />
              <span class="interest">爱好运动，文学，历史</span>
            </p>
          </div>
        </div>
      </div>
      <div class="item tool">
        <div class="title">
          <h3>我的技能</h3>
        </div>
        <div class="layui-fluid">
          <div class="layui-row">
            <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
              <div class="cont-box">
                <img src="../static/res/img/php.jpg" width="150px" height="100px">
                <h3>80%</h3>
              </div>
            </div>
            <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
              <div class="cont-box">
                <img src="../static/res/img/vue.jpg" width="150px" height="100px">
                <h3>60%</h3>
              </div>
            </div>
            <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
              <div class="cont-box">
                <img src="../static/res/img/golang.jpg" width="150px" height="100px">
                <h3>60%</h3>
              </div>
            </div>
            <div class="layui-col-xs6 layui-col-sm3 layui-col-md3">
              <div class="cont-box">
                <img src="../static/res/img/react.jpg" width="200px" height="100px">
                <h3>70%</h3>
              </div>
            </div>
          </div>
        </div>
      </div>
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
    }).use(['element','laypage','form','layer','menu'],function(){
      element = layui.element,laypage = layui.laypage,form = layui.form,layer = layui.layer,menu = layui.menu;
      menu.init();
    })
  </script>
</body>
</html>