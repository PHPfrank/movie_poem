package controllers

import (
	//"blog/models"
)

type AboutController struct {
	BaseController
}

func (self *AboutController) Get() {
	self.TplName = "about.tpl"
}