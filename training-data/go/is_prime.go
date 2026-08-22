package main

import "fmt"

func isPrime(n int) bool {
	if n < 2 {
		return false
	}
	if n == 2 || n == 3 {
		return true
	}
	if n%2 == 0 {
		return false
	}
	for i := 3; i*i <= n; i += 2 {
		if n%i == 0 {
			return false
		}
	}
	return true
}

func main() {
	var primes []int
	for n := 0; n < 20; n++ {
		if isPrime(n) {
			primes = append(primes, n)
		}
	}
	fmt.Println(primes)
}
