package controllers

import (
	"blog/models"
)

type MoviesController struct {
	BaseController
}

func (self *MoviesController) Get() {
	//接收参数
	id, err := self.GetInt("id")
	if err != nil {
		id = 1
	}
	//获取数据
	movie, _ := models.MoviesGetById(id)
	row := make(map[string]interface{})
	//字段处理
	if (movie != nil) {
		row["id"] = movie.Id
		row["title"] = movie.Title
		row["original_title"] = movie.Original_title
		row["summary"] = movie.Summary
		row["year"] = movie.Year
		row["image"] = movie.Image
		row["casts"] = movie.Casts
		row["directors"] = movie.Directors
		row["genres"] = movie.Genres
	}
	//筛选条件
	filters := make([]interface{}, 0)
	filters = append(filters, "movie_id", id)
	//获取评论
	comments,count := models.CommentsGetList(1,5,filters...)
	//评论数据处理
	list := make([]map[string]interface{}, len(comments))
	for k, v := range comments {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["nickname"] = v.Nickname
		row["content"] = v.Content
		row["created_at"] = v.Created_at
		list[k] = row
	}
	//数据返回
	self.Data["Comments"] = list
	self.Data["Movie"] = row
	self.Data["Count"] = count
	self.TplName = "detail.tpl"
}