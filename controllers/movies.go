package controllers

import (
	//"github.com/astaxie/beego"
	"blog/models"
	//"strconv"
	//"fmt"
)

type MoviesController struct {
	BaseController
}

func (self *MoviesController) Get() {
	id, err := self.GetInt("id")
	if err != nil {
		id = 1
	}
	movie, _ := models.MoviesGetById(id)
	row := make(map[string]interface{})
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
	filters := make([]interface{}, 0)
	filters = append(filters, "movie_id", id)
	comments,count := models.CommentsGetList(1,5,filters...)
	list := make([]map[string]interface{}, len(comments))
	for k, v := range comments {
		row := make(map[string]interface{})
		row["id"] = v.Id
		row["nickname"] = v.Nickname
		row["content"] = v.Content
		row["created_at"] = v.Created_at
		list[k] = row
	}
	self.Data["Comments"] = list
	self.Data["Movie"] = row
	self.Data["Count"] = count
	self.TplName = "detail.tpl"
}