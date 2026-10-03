package main

import "fmt"

// extendedGCD returns g, x, y such that a*x + b*y = g = gcd(a, b).
func extendedGCD(a, b int) (int, int, int) {
	if b == 0 {
		return a, 1, 0
	}
	g, x1, y1 := extendedGCD(b, a%b)
	x := y1
	y := x1 - (a/b)*y1
	return g, x, y
}

func main() {
	a, b := 35, 15
	g, x, y := extendedGCD(a, b)
	fmt.Printf("gcd(%d, %d) = %d\n", a, b, g)
	fmt.Printf("%d*%d + %d*%d = %d\n", a, x, b, y, a*x+b*y)
}
