package main

import "fmt"

// Positive n that can be written as a*a + b*b with a, b >= 0.
func representable(n int) bool {
	for a := 0; a*a <= n; a++ {
		for b := a; a*a+b*b <= n; b++ {
			if a*a+b*b == n {
				return true
			}
		}
	}
	return false
}

func main() {
	for n := 1; n <= 30; n++ {
		if representable(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
