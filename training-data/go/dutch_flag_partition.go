package main

import "fmt"

type color int

const (
	red color = iota
	white
	blue
)

func (c color) String() string { return [...]string{"R", "W", "B"}[c] }

func sortFlags(a []color) {
	lo, mid, hi := 0, 0, len(a)-1
	for mid <= hi {
		switch a[mid] {
		case red:
			a[lo], a[mid] = a[mid], a[lo]
			lo++
			mid++
		case white:
			mid++
		case blue:
			a[mid], a[hi] = a[hi], a[mid]
			hi--
		}
	}
}

func main() {
	flags := []color{blue, red, white, blue, red, white, red}
	sortFlags(flags)
	fmt.Println(flags)
}
