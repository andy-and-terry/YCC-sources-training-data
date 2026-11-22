package main

import "fmt"

// Emirps: primes whose digit reversal is a different prime.
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

func reverse(n int) int {
	r := 0
	for ; n > 0; n /= 10 {
		r = r*10 + n%10
	}
	return r
}

func main() {
	for n := 2; n < 200; n++ {
		if r := reverse(n); r != n && isPrime(n) && isPrime(r) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
