package main

import "fmt"

type Weekday int

const (
	Sunday Weekday = iota
	Monday
	Tuesday
)

func (d Weekday) String() string {
	return [...]string{"Sun", "Mon", "Tue"}[d]
}

func main() {
	fmt.Println(Monday, Tuesday)
	fmt.Printf("%v %d\n", Sunday, Sunday)
}
