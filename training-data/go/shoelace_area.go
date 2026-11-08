package main

import (
	"fmt"
	"math"
)

type Pt struct{ X, Y float64 }

func shoelace(p []Pt) float64 {
	s := 0.0
	for i := range p {
		q := p[(i+1)%len(p)]
		s += p[i].X*q.Y - q.X*p[i].Y
	}
	return math.Abs(s) / 2
}

func main() { fmt.Println(shoelace([]Pt{{0, 0}, {4, 0}, {4, 3}, {0, 3}})) }
