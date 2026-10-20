package main

import (
	"fmt"
	"reflect"
)

type User struct {
	Name  string `validate:"required" json:"name"`
	Age   int    `validate:"min=18" json:"age"`
	email string
}

func main() {
	t := reflect.TypeOf(User{})
	for i := 0; i < t.NumField(); i++ {
		f := t.Field(i)
		fmt.Println(f.Name, f.Type, f.Tag.Get("validate"), f.IsExported())
	}
	u := User{Name: "ann", Age: 20}
	v := reflect.ValueOf(&u).Elem()
	v.FieldByName("Age").SetInt(41)
	fmt.Println(u.Age, v.Kind(), v.NumField())
}
