package main

import "fmt"

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

// Goldbach: two primes summing to an even number.
func goldbach(n int) (int, int, bool) {
	for p := 2; p <= n/2; p++ {
		if isPrime(p) && isPrime(n-p) {
			return p, n - p, true
		}
	}
	return 0, 0, false
}

func main() {
	a, b, _ := goldbach(28)
	fmt.Println(a, b)
}
