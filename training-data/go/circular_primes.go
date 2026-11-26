package main

import (
	"fmt"
	"strconv"
)

// Circular primes below 100; expect 13.
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

func circular(n int) bool {
	s := strconv.Itoa(n)
	for i := range s {
		v, _ := strconv.Atoi(s[i:] + s[:i])
		if !isPrime(v) {
			return false
		}
	}
	return true
}

func main() {
	c := 0
	for n := 2; n < 100; n++ {
		if circular(n) {
			c++
		}
	}
	fmt.Println(c)
}
