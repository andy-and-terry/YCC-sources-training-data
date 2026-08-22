package main

import "fmt"

func gcd(a, b int) int {
	for b != 0 {
		a, b = b, a%b
	}
	if a < 0 {
		return -a
	}
	return a
}

func lcm(a, b int) int {
	if a == 0 || b == 0 {
		return 0
	}
	g := gcd(a, b)
	result := a / g * b
	if result < 0 {
		return -result
	}
	return result
}

func main() {
	fmt.Println(gcd(48, 18), lcm(4, 6))
}
