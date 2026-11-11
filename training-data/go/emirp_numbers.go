// Emirps: primes whose digit reversal is a different prime.
package main

import "fmt"

func isPrime(n int) bool {
	if n < 2 {
		return false
	}
	for i := 2; i*i <= n; i++ {
		if n%i == 0 {
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
	for n := 2; n < 100; n++ {
		if r := reverse(n); r != n && isPrime(n) && isPrime(r) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
