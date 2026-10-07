package main

import (
	"fmt"
	"sort"
)

func classify(a, b, c float64) string {
	s := []float64{a, b, c}
	sort.Float64s(s)
	switch {
	case s[0] <= 0 || s[0]+s[1] <= s[2]:
		return "invalid"
	case a == b && b == c:
		return "equilateral"
	case a == b || b == c || a == c:
		return "isosceles"
	default:
		return "scalene"
	}
}

func main() {
	fmt.Println(classify(3, 3, 3), classify(3, 4, 4), classify(3, 4, 5), classify(1, 1, 3))
}
