package models

import (
	"github.com/astaxie/beego/orm"
)

type Movies struct {
	Id          	int    
	Title      		string 
	Original_title  string 
	Summary     	string 
	Year        	string 
	Rating			string 
	Image			string 
	Casts			string 
	Directors		string 
	Genres			string 
}

func (a *Movies) TableName() string {
	return TableName("movies")
}

func MoviesAdd(a *Movies) (int64, error) {
	return orm.NewOrm().Insert(a)
}

func MoviesGetList(page, pageSize int, filters ...interface{}) ([]*Movies, int64) {
	offset := (page - 1) * pageSize
	list := make([]*Movies, 0)
	query := orm.NewOrm().QueryTable(TableName("movies"))
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

func MoviesGetById(id int) (*Movies, error) {
	r := new(Movies)
	err := orm.NewOrm().QueryTable(TableName("movies")).Filter("id", id).One(r)
	if err != nil {
		return nil, err
	}
	return r, nil
}