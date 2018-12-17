package controllers

import (
	//"github.com/astaxie/beego"
	"blog/models"
	//"strconv"
	//"fmt"
)

type PoemsController struct {
	BaseController
}

func (self *PoemsController) Get() {
	//查询条件
	page, err := self.GetInt("page")
	if err != nil {
		page = 1
	}
	self.Data["Page"] = page
	filters := make([]interface{}, 0)
	//filters = append(filters, "rating", "0")
	//获取数据
	result, count := models.PoemsGetList(page, 10, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["content"] = v.Content
		row["title"] = v.Title 
		row["dynasty"] = v.Dynasty
		row["author"] = v.Author
		row["popularity"] = v.Popularity
		list[k] = row
	}
	self.Data["Poems"] = list
	self.Data["Count"] = count
	self.TplName = "poem.tpl"
}