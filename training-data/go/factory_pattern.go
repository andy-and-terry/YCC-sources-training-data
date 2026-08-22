package main

import (
	"fmt"
	"math"
)

type shape interface {
	area() float64
}

type circle struct {
	radius float64
}

func (c circle) area() float64 {
	return math.Pi * c.radius * c.radius
}

type square struct {
	side float64
}

func (s square) area() float64 {
	return s.side * s.side
}

func shapeFactory(kind string, param float64) shape {
	switch kind {
	case "circle":
		return circle{radius: param}
	case "square":
		return square{side: param}
	default:
		panic("unknown shape: " + kind)
	}
}

func main() {
	fmt.Println(shapeFactory("circle", 2).area())
	fmt.Println(shapeFactory("square", 3).area())
}
