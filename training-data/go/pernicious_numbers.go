package main

import (
	"fmt"
	"math/bits"
)

func isPrime(n int) bool {
	if n < 2 {
		return false
	}
	for d := 2; d*d <= n; d++ {
		if n%d == 0 {
			return false
		}
	}
	return true
}

// Pernicious numbers: the popcount is prime.
func main() {
	for n := 1; n <= 20; n++ {
		if isPrime(bits.OnesCount(uint(n))) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
