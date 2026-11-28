package main

import (
	"fmt"
	"math"
)

type Point struct{ X, Y float64 }

func area(pts []Point) float64 {
	s := 0.0
	for i, p := range pts {
		q := pts[(i+1)%len(pts)]
		s += p.X*q.Y - q.X*p.Y
	}
	return math.Abs(s) / 2
}

func main() {
	fmt.Println(area([]Point{{0, 0}, {4, 0}, {4, 3}, {0, 3}}))
}
