package controllers

import (
	//"github.com/astaxie/beego"
	"blog/models"
	"strings"
	//"fmt"
)

type CommentsController struct {
	BaseController
}

func (self *CommentsController) Post() {
	id, _ := self.GetInt("id")

	Comment := new(models.Comments)
	Comment.Movie_id = id
	Comment.Nickname = strings.TrimSpace(self.GetString("nickname"))
	Comment.Content = strings.TrimSpace(self.GetString("content"))
	
	if _, err := models.CommentsAdd(Comment); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)

}
