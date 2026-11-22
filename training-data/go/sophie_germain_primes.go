package main

import "fmt"

// Sophie Germain primes: p prime and 2p + 1 prime.
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
		if isPrime(p) && isPrime(2*p+1) {
			fmt.Print(p, " ")
		}
	}
	fmt.Println()
}
