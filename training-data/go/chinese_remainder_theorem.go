package main

import "fmt"

func extGCD(a, b int) (int, int, int) {
	if b == 0 {
		return a, 1, 0
	}
	g, x1, y1 := extGCD(b, a%b)
	return g, y1, x1 - (a/b)*y1
}

// crt solves x = remainders[i] (mod moduli[i]) for all i, assuming pairwise coprime moduli.
func crt(remainders, moduli []int) int {
	prod := 1
	for _, m := range moduli {
		prod *= m
	}
	result := 0
	for i, m := range moduli {
		partial := prod / m
		_, inv, _ := extGCD(partial, m)
		term := remainders[i] * partial * inv
		result += term
	}
	result %= prod
	if result < 0 {
		result += prod
	}
	return result
}

func main() {
	remainders := []int{2, 3, 2}
	moduli := []int{3, 5, 7}
	fmt.Println("x =", crt(remainders, moduli))
}
