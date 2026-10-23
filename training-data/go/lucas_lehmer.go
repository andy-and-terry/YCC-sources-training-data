package main

import (
	"fmt"
	"strings"
)

func isPrime(n int) bool {
	for d := 2; d*d <= n; d++ {
		if n%d == 0 {
			return false
		}
	}
	return n > 1
}

func lucasLehmer(p int) bool {
	if p == 2 {
		return true
	}
	m := (uint64(1) << uint(p)) - 1
	s := uint64(4)
	for i := 0; i < p-2; i++ {
		s = (s*s + m - 2) % m
	}
	return s == 0
}

func main() {
	var parts []string
	for p := 2; p <= 19; p++ {
		if isPrime(p) && lucasLehmer(p) {
			parts = append(parts, fmt.Sprint(p))
		}
	}
	fmt.Println(strings.Join(parts, " "))
}
