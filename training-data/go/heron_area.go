package main

import (
	"errors"
	"fmt"
	"math"
)

func heron(a, b, c float64) (float64, error) {
	if a+b <= c || a+c <= b || b+c <= a {
		return 0, errors.New("sides violate the triangle inequality")
	}
	s := (a + b + c) / 2
	return math.Sqrt(s * (s - a) * (s - b) * (s - c)), nil
}

func main() {
	fmt.Println(heron(3, 4, 5))
	fmt.Println(heron(1, 2, 10))
}
