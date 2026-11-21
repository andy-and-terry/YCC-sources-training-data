package main

import "fmt"

// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
func gcd(a, b int) int {
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

func phi(n int) int {
	c := 0
	for k := 1; k <= n; k++ {
		if gcd(k, n) == 1 {
			c++
		}
	}
	return c
}

func isPerfectTotient(n int) bool {
	total := 0
	for m := n; m > 1; {
		m = phi(m)
		total += m
	}
	return total == n
}

func main() {
	for n := 2; n < 200; n++ {
		if isPerfectTotient(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
