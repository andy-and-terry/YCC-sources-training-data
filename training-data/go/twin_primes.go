package main

import "fmt"

// Twin primes below a limit using a sieve.
func main() {
	limit := 50
	sieve := make([]bool, limit+3)
	for i := 2; i < len(sieve); i++ {
		sieve[i] = true
	}
	for i := 2; i*i < len(sieve); i++ {
		if sieve[i] {
			for j := i * i; j < len(sieve); j += i {
				sieve[j] = false
			}
		}
	}
	for p := 2; p <= limit; p++ {
		if sieve[p] && sieve[p+2] {
			fmt.Printf("(%d,%d) ", p, p+2)
		}
	}
	fmt.Println()
}
