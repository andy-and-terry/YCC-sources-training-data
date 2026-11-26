package main

import "fmt"

// Goldbach partitions of 100; expect 6.
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
	var pairs [][2]int
	for p := 2; p <= 50; p++ {
		if isPrime(p) && isPrime(100-p) {
			pairs = append(pairs, [2]int{p, 100 - p})
		}
	}
	fmt.Println(pairs, len(pairs))
}
