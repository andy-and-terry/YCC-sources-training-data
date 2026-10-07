package main

import "fmt"

type point struct {
	x, y int
}

// String implements the fmt.Stringer interface so point controls its
// own textual representation whenever it is formatted with %v or %s.
func (p point) String() string {
	return fmt.Sprintf("(%d, %d)", p.x, p.y)
}

func main() {
	p := point{3, 4}
	fmt.Println(p)
	fmt.Printf("point: %v\n", p)
	fmt.Printf("point: %s\n", p)
}
