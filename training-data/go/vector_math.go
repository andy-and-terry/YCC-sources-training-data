package main

import (
	"fmt"
	"math"
)

type vector3 struct {
	x, y, z float64
}

func (a vector3) add(b vector3) vector3 {
	return vector3{a.x + b.x, a.y + b.y, a.z + b.z}
}

func (a vector3) dot(b vector3) float64 {
	return a.x*b.x + a.y*b.y + a.z*b.z
}

func (a vector3) cross(b vector3) vector3 {
	return vector3{
		a.y*b.z - a.z*b.y,
		a.z*b.x - a.x*b.z,
		a.x*b.y - a.y*b.x,
	}
}

func (a vector3) length() float64 {
	return math.Sqrt(a.dot(a))
}

func main() {
	a := vector3{1, 0, 0}
	b := vector3{0, 1, 0}
	fmt.Println(a.cross(b), a.dot(b), a.add(b).length())
}
