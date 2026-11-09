package main

import "fmt"

type Base struct{ ID int }

func (b Base) Describe() string { return fmt.Sprintf("id=%d", b.ID) }

type User struct {
	Base
	Name string
}

func main() {
	u := User{Base{7}, "ann"}
	fmt.Println(u.ID, u.Describe(), u.Name)
}
