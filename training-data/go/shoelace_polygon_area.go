package main

import (
	"fmt"
	"math"
)

type point struct{ x, y float64 }

// Polygon area via the shoelace formula.
func area(pts []point) float64 {
	s := 0.0
	for i, p := range pts {
		q := pts[(i+1)%len(pts)]
		s += p.x*q.y - q.x*p.y
	}
	return math.Abs(s) / 2
}

func main() {
	fmt.Println(area([]point{{0, 0}, {4, 0}, {4, 3}, {0, 3}}))
}
