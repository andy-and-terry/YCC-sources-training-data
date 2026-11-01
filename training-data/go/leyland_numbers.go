package main

import (
	"fmt"
	"math"
)

// Leyland numbers: x^y + y^x for x >= y >= 2.
func leyland(x, y float64) int {
	return int(math.Pow(x, y) + math.Pow(y, x))
}

func main() {
	for x := 2; x <= 4; x++ {
		for y := 2; y <= x; y++ {
			fmt.Print(leyland(float64(x), float64(y)), " ")
		}
	}
	fmt.Println()
}
