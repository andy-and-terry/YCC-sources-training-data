package main

import "fmt"

// n(2n^2+1)/3
func term(n int) int {
	return (n * (((2 * n) * n) + 1)) / 3
}

func main() {
	for n := 1; n <= 15; n++ {
		fmt.Printf("%2d -> %d\n", n, term(n))
	}
}
