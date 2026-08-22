package main

import "fmt"

func sieve(limit int) []int {
	isPrime := make([]bool, limit+1)
	for i := range isPrime {
		isPrime[i] = true
	}
	if limit >= 0 {
		isPrime[0] = false
	}
	if limit >= 1 {
		isPrime[1] = false
	}
	for n := 2; n*n <= limit; n++ {
		if isPrime[n] {
			for multiple := n * n; multiple <= limit; multiple += n {
				isPrime[multiple] = false
			}
		}
	}
	var primes []int
	for n, prime := range isPrime {
		if prime {
			primes = append(primes, n)
		}
	}
	return primes
}

func main() {
	fmt.Println(sieve(50))
}
