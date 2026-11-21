package main

import (
	"fmt"
	"math"
	"strconv"
)

// Disarium numbers: digits raised to their 1-based positions sum to n.
func isDisarium(n int) bool {
	sum := 0
	for i, c := range strconv.Itoa(n) {
		sum += int(math.Pow(float64(c-'0'), float64(i+1)))
	}
	return sum == n
}

func main() {
	for n := 1; n < 1000; n++ {
		if isDisarium(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
