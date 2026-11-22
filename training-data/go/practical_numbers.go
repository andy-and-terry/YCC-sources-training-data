package main

import "fmt"

// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
func isPractical(n int) bool {
	reach := uint64(1) // bit i set <=> i is a subset sum
	for d := 1; d <= n; d++ {
		if n%d == 0 {
			reach |= reach << uint(d)
		}
	}
	mask := uint64(1)<<uint(n+1) - 1
	return reach&mask == mask
}

func main() {
	for n := 1; n <= 40; n++ {
		if isPractical(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
