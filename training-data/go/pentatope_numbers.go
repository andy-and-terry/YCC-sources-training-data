package main

import "fmt"

// n(n+1)(n+2)(n+3)/24
func term(n int) int {
	return (((n * (n + 1)) * (n + 2)) * (n + 3)) / 24
}

func main() {
	for n := 1; n <= 15; n++ {
		fmt.Printf("%2d -> %d\n", n, term(n))
	}
}
