package main

import (
	"fmt"
	"strconv"
)

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
	var out []string
	for n := 2; len(out) < 10; n++ {
		if r := reverse(n); r != n && isPrime(n) && isPrime(r) {
			out = append(out, strconv.Itoa(n))
		}
	}
	fmt.Println(out) // [13 17 31 37 71 73 79 97 107 113]
}
