package main

import (
	_ "blog/routers"// _可以理解成占位符，也可以理解成忽略这个变量
	"github.com/astaxie/beego"
	"blog/models"
)

func main() {
	//初始化model
	models.Init()
	// 启用session
	beego.BConfig.WebConfig.Session.SessionOn = true
	// 设置session c.SetSession(key, value)
	// 获取session c.GetSession(key)
	// 删除指定session c.DelSession(key)
	//  销毁session c.DestroySession()
	beego.Run()
}

