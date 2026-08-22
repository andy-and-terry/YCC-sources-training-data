package main

import (
	"fmt"
	"math"
)

type Shape interface {
	Area() float64
	Perimeter() float64
}

type Rectangle struct {
	Width, Height float64
}

func (r Rectangle) Area() float64      { return r.Width * r.Height }
func (r Rectangle) Perimeter() float64 { return 2 * (r.Width + r.Height) }

type Circle struct {
	Radius float64
}

func (c Circle) Area() float64      { return math.Pi * c.Radius * c.Radius }
func (c Circle) Perimeter() float64 { return 2 * math.Pi * c.Radius }

func describe(s Shape) string {
	return fmt.Sprintf("area=%.2f perimeter=%.2f", s.Area(), s.Perimeter())
}

func main() {
	shapes := []Shape{Rectangle{Width: 3, Height: 4}, Circle{Radius: 2}}
	for _, s := range shapes {
		fmt.Println(describe(s))
	}
}
