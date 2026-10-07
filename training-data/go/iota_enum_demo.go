package main

import "fmt"

type Weekday int

const (
	Sunday Weekday = iota
	Monday
	Tuesday
	Wednesday
)

func (d Weekday) String() string {
	return [...]string{"Sunday", "Monday", "Tuesday", "Wednesday"}[d]
}

type Perm uint8

const (
	Read Perm = 1 << iota
	Write
	Exec
)

func main() {
	fmt.Println(Monday, Wednesday)
	fmt.Printf("%d %v\n", Tuesday, Tuesday)

	p := Read | Exec
	fmt.Printf("%03b\n", p)
	fmt.Println("can write:", p&Write != 0)
	fmt.Println("can exec:", p&Exec != 0)
}
