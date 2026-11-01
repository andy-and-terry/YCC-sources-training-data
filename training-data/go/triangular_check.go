package main

import (
	"fmt"
	"math"
)

// n is triangular iff 8n+1 is a perfect square.
func isTriangular(n int) bool {
	s := 8*n + 1
	r := int(math.Sqrt(float64(s)))
	return r*r == s
}

func main() {
	for n := 0; n <= 20; n++ {
		if isTriangular(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
