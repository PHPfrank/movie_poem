package routers

import (
	"blog/controllers"
	"github.com/astaxie/beego"
)

func init() {
	//首页
	beego.Router("/", &controllers.MainController{})
	beego.Router("/index", &controllers.MainController{})
	//电影详情
	beego.Router("/detail",&controllers.MoviesController{})
	//提交评论
	beego.Router("/addComment",&controllers.CommentsController{})
	//微语
	beego.Router("/about",&controllers.AboutController{})
	//关于我
	beego.Router("/about",&controllers.AboutController{})

}
