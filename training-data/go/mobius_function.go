package main

import "fmt"

// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
func mobius(n int) int {
	result := 1
	for p := 2; p*p <= n; p++ {
		if n%p == 0 {
			n /= p
			if n%p == 0 {
				return 0
			}
			result = -result
		}
	}
	if n > 1 {
		return -result
	}
	return result
}

func main() {
	for n := 1; n <= 30; n++ {
		fmt.Print(mobius(n), " ")
	}
	fmt.Println()
}
