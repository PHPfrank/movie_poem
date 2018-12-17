package models

import (
	"github.com/astaxie/beego/orm"
)

type Words struct {
	Id          	int    
	Content      	string 
	Author			string 
	Img				string 
	Img_author		string 
	Date			string
}

func (a *Words) TableName() string {
	return TableName("words")
}

func WordsAdd(a *Words) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func WordsGetList(page, pageSize int, filters ...interface{}) ([]*Words, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Words, 0)
	query := orm.NewOrm().QueryTable(TableName("words"))
	if len(filters) > 0 {
		l := len(filters)

		for k := 0; k < l; k += 2 {
			query = query.Filter(filters[k].(string), filters[k+1])
		}
	}
	total, _ := query.Count()
	query.OrderBy("id").Limit(pageSize, offset).All(&list)

	return list, total
}

func WordsGetById(id int) (*Words, error) {
	r := new(Words)
	err := orm.NewOrm().QueryTable(TableName("words")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}