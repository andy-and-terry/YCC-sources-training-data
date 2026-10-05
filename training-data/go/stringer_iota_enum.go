package main

import "fmt"

type Weekday int

const (
	Sunday Weekday = iota
	Monday
	Tuesday
	Wednesday
)

var names = [...]string{"Sunday", "Monday", "Tuesday", "Wednesday"}

func (d Weekday) String() string {
	if d < 0 || int(d) >= len(names) {
		return fmt.Sprintf("Weekday(%d)", int(d))
	}
	return names[d]
}

type ByteSize float64

const (
	_           = iota
	KB ByteSize = 1 << (10 * iota)
	MB
	GB
)

func main() {
	fmt.Println(Monday, Weekday(9))
	fmt.Printf("%v %d\n", Tuesday, Tuesday)
	fmt.Println(KB, MB, GB)
}
