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

func main() {
	found := 0
	for y := 1; found < 8; y++ {
		p := 3*y*y + 3*y + 1
		if isPrime(p) {
			fmt.Print(p, " ")
			found++
		}
	}
	fmt.Println()
}
