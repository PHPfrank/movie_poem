package routers

import (
	"blog/controllers"
	"github.com/astaxie/beego"
)

func init() {
	
	//自定义路由
	beego.Router("/", &controllers.MainController{},"*:Get")
	//首页
	beego.Router("/index", &controllers.MainController{})
	//电影详情
	beego.Router("/detail",&controllers.MoviesController{})
	//心诗
	beego.Router("/poems",&controllers.PoemsController{})
	//微语
	beego.Router("/words",&controllers.WordsController{})
	//关于我
	beego.Router("/about",&controllers.AboutController{})	
	//提交评论
	//提交评论
	beego.Router("/post_comment",&controllers.CommentsController{},"*:PostComment")

}
