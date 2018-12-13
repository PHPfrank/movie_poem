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


  <div class="content whisper-content leacots-content details-content">
    <div class="cont w1000">
      <div class="whisper-list">
        <div class="item-box">
          <div class="review-version">
              <div class="form-box">
                <div class="article-cont">
                  <div class="title">
                    <h3>{{.Movie.title}}</h3>
                    <p class="cont-info"><span class="data">{{.Movie.year}}</span><span class="types">{{.Movie.genres}}</span></p>
                  </div>
                  <div align="center">
                  <img src="{{.Movie.image}}">
                  </div>
                  <p>{{.Movie.summary}}</p>
                  <div class="btn-box">
                    <button class="layui-btn layui-btn-primary">上一篇</button>
                    <button class="layui-btn layui-btn-primary">下一篇</button>
                  </div>
                </div>
              </div>
              <div class="volume">
                观影评论区 <span>10</span>
              </div>
              {{range $ind, $elem := .Comments}}
              <div class="list-cont">
                <div class="cont">
                  <div class="img">
                    <img src="../static/res/img/header.png" alt="">
                  </div>
                  <div class="text">
                    <p class="tit"><span class="name">{{$elem.nickname}}</span><span class="data">2018/06/06</span></p>
                    <p class="ct">{{$elem.content}}</p>
                  </div>
                </div>
              </div>
              {{end}}
              <div class="form">
                <form class="layui-form" action="">
                  <div class="layui-form-item layui-form-text">
                    <input type="hidden" name="id" value={{.Movie.id}}>
                    <div class="layui-form-item">
                      <div class="layui-input-block">
                        <input type="text" name="nickname" required lay-verify="required" placeholder="请输入评论昵称" autocomplete="off" class="layui-input">
                      </div>                        
                    </div>
                    <div class="layui-input-block">
                      <textarea name="content" required lay-verify="required" placeholder="既然来了，就说几句" class="layui-textarea"></textarea>
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <div class="layui-input-block">
                      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                  </div>
                </form>
              </div>
          </div>
        </div>
      </div>
      <div id="page" style="text-align: center;"></div>
    </div>
  </div>
  <script type="text/html" id="laytplCont">
    
  </script>
  <div class="footer-wrap">
    <div class="footer w1000">
      <div class="qrcode">
        <img src="../static/res/img/erweima.jpg">
      </div>
      <div class="practice-mode">
        <img src="../static/res/img/down_img.jpg">
        <div class="text">
          <h4 class="title">我的联系方式</h4>
          <p>微信<span class="WeChat">12345678</span></p>
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
        ,limit: 10
        ,curr:{{.Page}}
        ,jump:function(data, first){
            var page = data.curr;
            $("#currPage").val(page);
            var limt = data.limit;
            $("#limit").val(limt);
            if(!first){ //点击右下角分页时调用
                //window.location.href="/index?page="+page;
            }
        }
      });
      menu.init();
    })

    layui.use('form', function(){
      var form = layui.form;
      //监听提交
      var $ = layui.jquery;
      form.on('submit(formDemo)', function(data){
        $.ajax({
                url:'addComment',
                method:'post',
                data:data.field,
                dataType:'JSON',
                success:function(res){
                    if(res.status == 0){
                        layer.msg('评论成功咯~', {
                            icon: 1,
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                          }, function(){
                             location.reload();
                          });    
                    }else{
                        layer.msg('服务器正忙，请稍后再试', {
                            icon: 5,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                          }, function(){
                             location.reload();
                          });  
                    }                    
                },
                error:function (data) {
                }
            })
        return false;
      });
    });

  </script>
</body>
</html>