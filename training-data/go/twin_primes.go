package main

import "fmt"

// Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
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
	for p := 2; p < 100; p++ {
		if isPrime(p) && isPrime(p+2) {
			fmt.Print(p, " ")
		}
	}
	fmt.Println()
}
