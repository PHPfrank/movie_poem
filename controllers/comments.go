package controllers

import (
	//"github.com/astaxie/beego"
	"blog/models"
	"strings"
	"time"
)

type CommentsController struct {
	BaseController
}

func (self *CommentsController) PostComment() {
	id, _ := self.GetInt("id")

	Comment := new(models.Comments)
	Comment.Movie_id = id
	Comment.Nickname = strings.TrimSpace(self.GetString("nickname"))
	Comment.Content = strings.TrimSpace(self.GetString("content"))
	Comment.Created_at = time.Now().Format("2006-01-02 15:04:05")
	
	if _, err := models.CommentsAdd(Comment); err != nil {
		self.ajaxMsg(err.Error(), MSG_ERR)
	}
	self.ajaxMsg("", MSG_OK)

}
