package models

import (
	"github.com/astaxie/beego/orm"
)

type Comments struct {
	Id          	int    
	Movie_id      	int
	Nickname		string 
	Content    		string 
}

func (a *Comments) TableName() string {
	return TableName("comments")
}

func CommentsAdd(a *Comments) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func CommentsGetList(page, pageSize int, filters ...interface{}) ([]*Comments, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Comments, 0)
	query := orm.NewOrm().QueryTable(TableName("comments"))
	if len(filters) > 0 {
		l := len(filters)

		for k := 0; k < l; k += 2 {
			query = query.Filter(filters[k].(string), filters[k+1])
		}
	}
	total, _ := query.Count()
	query.OrderBy("-id").Limit(pageSize, offset).All(&list)

	return list, total
}

func CommentsGetById(id int) (*Comments, error) {
	r := new(Comments)
	err := orm.NewOrm().QueryTable(TableName("comments")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}