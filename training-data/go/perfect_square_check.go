package main

import (
	"fmt"
	"math"
)

func isPerfectSquare(n int) bool {
	if n < 0 {
		return false
	}
	r := int(math.Sqrt(float64(n)))
	return r*r == n
}

func main() {
	for n := 0; n < 30; n++ {
		if isPerfectSquare(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
