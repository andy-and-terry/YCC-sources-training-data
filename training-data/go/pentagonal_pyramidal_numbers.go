package main

import "fmt"

// n^2(n+1)/2
func term(n int) int {
	return ((n * n) * (n + 1)) / 2
}

func main() {
	for n := 1; n <= 15; n++ {
		fmt.Printf("%2d -> %d\n", n, term(n))
	}
}
