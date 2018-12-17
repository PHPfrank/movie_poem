package controllers

import (
	//"github.com/astaxie/beego"
	"blog/models"
	//"strconv"
	//"fmt"
)

type WordsController struct {
	BaseController
}

func (self *WordsController) Get() {
	//查询条件
	page, err := self.GetInt("page")
	if err != nil {
		page = 1
	}
	self.Data["Page"] = page
	filters := make([]interface{}, 0)
	//filters = append(filters, "rating", "0")
	//获取数据
	result, count := models.WordsGetList(page, 5, filters...)
	list := make([]map[string]interface{}, len(result))
	for k, v := range result {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["content"] = v.Content
		row["author"] = v.Author
		row["img"] = v.Img
		row["date"] = v.Date
		row["img_author"] = v.Img_author
		list[k] = row
	}
	self.Data["Words"] = list
	self.Data["Count"] = count
	self.TplName = "words.tpl"
}