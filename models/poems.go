package models

import (
	"github.com/astaxie/beego/orm"
)

type Poems struct {
	Id          	int    
	Content      	string 
	Title  	        string 
	Dynasty     	string 
	Origin        	string 
	Author			string 
	Translate		string 
	Popularity		string 
	Tags			string
}

func (a *Poems) TableName() string {
	return TableName("poems")
}

func PoemsAdd(a *Poems) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func PoemsGetList(page, pageSize int, filters ...interface{}) ([]*Poems, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Poems, 0)
	query := orm.NewOrm().QueryTable(TableName("poems"))
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

func PoemsGetById(id int) (*Poems, error) {
	r := new(Poems)
	err := orm.NewOrm().QueryTable(TableName("poems")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}