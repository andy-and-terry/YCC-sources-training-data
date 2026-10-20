package main

import "fmt"

type Weekday int

const (
	Monday Weekday = iota
	Tuesday
	Wednesday
)

// Implementing fmt.Stringer customizes how %v and Println print a value.
func (d Weekday) String() string {
	return [...]string{"Mon", "Tue", "Wed"}[d]
}

func main() {
	fmt.Println(Monday, Wednesday)
	fmt.Printf("%v %d %s\n", Tuesday, Tuesday, Tuesday)
}
