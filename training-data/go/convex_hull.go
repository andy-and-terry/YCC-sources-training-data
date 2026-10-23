package main

import (
	"fmt"
	"sort"
)

type Point struct{ X, Y int }

func cross(o, a, b Point) int {
	return (a.X-o.X)*(b.Y-o.Y) - (a.Y-o.Y)*(b.X-o.X)
}

// Andrew's monotone chain: returns hull in counter-clockwise order.
func convexHull(pts []Point) []Point {
	p := append([]Point(nil), pts...)
	sort.Slice(p, func(i, j int) bool {
		if p[i].X != p[j].X {
			return p[i].X < p[j].X
		}
		return p[i].Y < p[j].Y
	})
	if len(p) < 3 {
		return p
	}
	hull := make([]Point, 0, 2*len(p))
	for _, q := range p {
		for len(hull) >= 2 && cross(hull[len(hull)-2], hull[len(hull)-1], q) <= 0 {
			hull = hull[:len(hull)-1]
		}
		hull = append(hull, q)
	}
	lower := len(hull) + 1
	for i := len(p) - 2; i >= 0; i-- {
		for len(hull) >= lower && cross(hull[len(hull)-2], hull[len(hull)-1], p[i]) <= 0 {
			hull = hull[:len(hull)-1]
		}
		hull = append(hull, p[i])
	}
	return hull[:len(hull)-1]
}

func main() {
	pts := []Point{{0, 0}, {2, 0}, {1, 1}, {2, 2}, {0, 2}, {1, 3}}
	fmt.Println(convexHull(pts))
}
