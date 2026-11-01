package main

import "fmt"

// Ways to write n as a sum of two or more consecutive positive integers.
func politeWays(n int) int {
	ways := 0
	for k := 2; k*(k+1)/2 <= n; k++ {
		if (n-k*(k-1)/2)%k == 0 {
			ways++
		}
	}
	return ways
}

func main() {
	for n := 1; n <= 16; n++ {
		fmt.Print(politeWays(n), " ")
	}
	fmt.Println()
}
