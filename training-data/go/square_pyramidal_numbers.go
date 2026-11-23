package main

import "fmt"

// n(n+1)(2n+1)/6
func term(n int) int {
	return ((n * (n + 1)) * ((2 * n) + 1)) / 6
}

func main() {
	for n := 1; n <= 15; n++ {
		fmt.Printf("%2d -> %d\n", n, term(n))
	}
}
