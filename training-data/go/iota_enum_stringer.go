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

type Flags uint8

const (
	Read Flags = 1 << iota
	Write
	Exec
)

func main() {
	fmt.Println(Monday, Tuesday)
	fmt.Printf("%v %d\n", Sunday, Sunday)
	perm := Read | Exec
	fmt.Printf("%03b has write: %t\n", perm, perm&Write != 0)
}
