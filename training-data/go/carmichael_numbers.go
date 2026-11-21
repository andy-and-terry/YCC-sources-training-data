package main

import "fmt"

// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
func gcd(a, b int) int {
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

func powMod(b, e, m int) int {
	r := 1
	b %= m
	for ; e > 0; e >>= 1 {
		if e&1 == 1 {
			r = r * b % m
		}
		b = b * b % m
	}
	return r
}

func isPrime(n int) bool {
	for p := 2; p*p <= n; p++ {
		if n%p == 0 {
			return false
		}
	}
	return n > 1
}

func isCarmichael(n int) bool {
	if isPrime(n) {
		return false
	}
	for a := 2; a < n; a++ {
		if gcd(a, n) == 1 && powMod(a, n-1, n) != 1 {
			return false
		}
	}
	return true
}

func main() {
	for n := 3; n < 3000; n += 2 {
		if isCarmichael(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
