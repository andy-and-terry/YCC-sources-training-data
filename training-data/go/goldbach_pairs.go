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

func main() {
	n := 28
	for p := 2; p <= n/2; p++ {
		if isPrime(p) && isPrime(n-p) {
			fmt.Printf("%d + %d\n", p, n-p)
		}
	}
}
