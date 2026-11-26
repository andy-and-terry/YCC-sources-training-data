package main

import (
	"fmt"
	"strconv"
)

// Palindromic primes below 200; expect 10.
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

func palindrome(n int) bool {
	s := strconv.Itoa(n)
	for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
		if s[i] != s[j] {
			return false
		}
	}
	return true
}

func main() {
	var found []int
	for n := 2; n < 200; n++ {
		if palindrome(n) && isPrime(n) {
			found = append(found, n)
		}
	}
	fmt.Println(found, len(found))
}
