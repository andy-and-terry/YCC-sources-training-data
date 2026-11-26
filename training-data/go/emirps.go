package main

import (
	"fmt"
	"strconv"
)

// Emirps below 200; expect 15.
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

func rev(n int) int {
	r, _ := strconv.Atoi(reverse(strconv.Itoa(n)))
	return r
}

func reverse(s string) string {
	b := []byte(s)
	for i, j := 0, len(b)-1; i < j; i, j = i+1, j-1 {
		b[i], b[j] = b[j], b[i]
	}
	return string(b)
}

func main() {
	c := 0
	for n := 2; n < 200; n++ {
		if r := rev(n); r != n && isPrime(n) && isPrime(r) {
			c++
		}
	}
	fmt.Println(c)
}
