package main

import (
	"fmt"
	"math"
)

func isPronic(x int) bool {
	n := int(math.Sqrt(float64(x)))
	return n*(n+1) == x
}

func main() {
	for n := 0; n < 10; n++ {
		fmt.Print(n*(n+1), " ")
	}
	fmt.Println() // 0 2 6 12 20 30 42 56 72 90
	fmt.Println(isPronic(56), isPronic(57)) // true false
}
