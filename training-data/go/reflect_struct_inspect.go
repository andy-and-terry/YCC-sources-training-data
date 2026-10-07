package main

import (
	"fmt"
	"reflect"
)

type Product struct {
	Name    string  `label:"product name"`
	Price   float64 `label:"unit price"`
	InStock bool    `label:"availability"`
}

func describe(v any) {
	t := reflect.TypeOf(v)
	val := reflect.ValueOf(v)

	fmt.Println("type:", t.Name())
	for i := 0; i < t.NumField(); i++ {
		field := t.Field(i)
		fmt.Printf("  %s (%s) = %v [%s]\n", field.Name, field.Type, val.Field(i).Interface(), field.Tag.Get("label"))
	}
}

func main() {
	p := Product{Name: "Widget", Price: 9.99, InStock: true}
	describe(p)

	fmt.Println(reflect.DeepEqual(p, Product{Name: "Widget", Price: 9.99, InStock: true}))
}
