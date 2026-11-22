package main

import "fmt"

// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
func fact(n int) int {
	if n <= 1 {
		return 1
	}
	return n * fact(n-1)
}

func comb(n, k int) int { return fact(n) / (fact(k) * fact(n-k)) }

func main() {
	n := 5
	for k := 1; k <= n; k++ {
		fmt.Print(comb(n-1, k-1)*fact(n)/fact(k), " ")
	}
	fmt.Println()
}
