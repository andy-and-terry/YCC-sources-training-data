package main

import "fmt"

// 6n(n-1)+1
func term(n int) int {
	return ((6 * n) * (n - 1)) + 1
}

func main() {
	for n := 1; n <= 15; n++ {
		fmt.Printf("%2d -> %d\n", n, term(n))
	}
}
