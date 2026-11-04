package main

import "fmt"

func gcd(a, b int) int {
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

func gcdAll(nums ...int) int {
	g := 0
	for _, n := range nums {
		g = gcd(g, n)
	}
	return g
}

func main() {
	fmt.Println(gcdAll(12, 18, 24))
	fmt.Println(gcdAll(7, 13))
}
