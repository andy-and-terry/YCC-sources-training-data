package main

import "fmt"

// 3n(n-1)+1
func term(n int) int {
	return ((3 * n) * (n - 1)) + 1
}

func main() {
	for n := 1; n <= 15; n++ {
		fmt.Printf("%2d -> %d\n", n, term(n))
	}
}
