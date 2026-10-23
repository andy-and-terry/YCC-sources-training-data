package main

import (
	"fmt"
	"strings"
)

func digitSum(n int) int {
	s := 0
	for ; n > 0; n /= 10 {
		s += n % 10
	}
	return s
}

func factorDigitSum(n int) int {
	total := 0
	for d := 2; n > 1; d++ {
		for n%d == 0 {
			total += digitSum(d)
			n /= d
		}
	}
	return total
}

func isPrime(n int) bool {
	for d := 2; d*d <= n; d++ {
		if n%d == 0 {
			return false
		}
	}
	return n > 1
}

func main() {
	var parts []string
	for n := 2; n < 100; n++ {
		if !isPrime(n) && digitSum(n) == factorDigitSum(n) {
			parts = append(parts, fmt.Sprint(n))
		}
	}
	fmt.Println(strings.Join(parts, " "))
}
