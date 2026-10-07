package main

import "fmt"

type Weekday int

const (
	Sunday Weekday = iota
	Monday
	Tuesday
)

func (d Weekday) String() string {
	switch d {
	case Sunday:
		return "Sunday"
	case Monday:
		return "Monday"
	case Tuesday:
		return "Tuesday"
	}
	return fmt.Sprintf("Weekday(%d)", int(d))
}

type Perm uint8

const (
	Read Perm = 1 << iota
	Write
	Exec
)

func main() {
	fmt.Println(Monday, Weekday(9))
	p := Read | Exec
	fmt.Println(p&Write != 0, p&Exec != 0, p)
}
