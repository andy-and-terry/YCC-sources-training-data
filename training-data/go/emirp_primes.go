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
	for p := 2; p < 100; p++ {
		if isPrime(p) && reverse(p) != p && isPrime(reverse(p)) {
			fmt.Print(p, " ")
		}
	}
	fmt.Println()
}
