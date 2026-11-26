package main

import "fmt"

// Sexy primes below 100; expect 16 pairs.
func isPrime(n int) bool {
	if n < 2 {
		return false
	}
	for d := 2; d*d <= n; d++ {
		if n%d == 0 {
			return false
		}
	}
	return true
}

func main() {
	c := 0
	for p := 2; p < 100; p++ {
		if isPrime(p) && isPrime(p+6) {
			c++
		}
	}
	fmt.Println(c)
}
