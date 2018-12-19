package controllers

import (
	"blog/models"
)

type MainController struct {
	BaseController
}

func (self *MainController) Get() {
	//查询条件
	page, err := self.GetInt("page")
	if err != nil {
		page = 1
	}
	self.Data["Page"] = page
	filters := make([]interface{}, 0)
	//filters = append(filters, "rating", "0")
	//获取数据
	result, count := models.MoviesGetList(page, 5, filters...)
	
	list := make([]map[string]interface{}, len(result))
	//数据处理
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["title"] = v.Title
		row["rating"] = v.Rating + "分" 
		row["summary"] = v.Summary
		row["image"] = v.Image
		row["directors"] = v.Directors
		list[k] = row
	}
	//数据返回
	self.Data["Movies"] = list
	self.Data["Count"] = count

	self.TplName = "index.tpl"
}

