package main

import "fmt"

func primeFactorCount(n int) int {
	count := 0
	for p := 2; p*p <= n; p++ {
		for n%p == 0 {
			n /= p
			count++
		}
	}
	if n > 1 {
		count++
	}
	return count
}

func main() {
	for n := 2; n < 30; n++ {
		if primeFactorCount(n) == 2 {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
