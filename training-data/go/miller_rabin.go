package main

import (
	"fmt"
	"math/rand"
)

func modPow(base, exp, mod int64) int64 {
	result := int64(1)
	base %= mod
	for exp > 0 {
		if exp&1 == 1 {
			result = result * base % mod
		}
		exp >>= 1
		base = base * base % mod
	}
	return result
}

func millerRabinTest(n, d int64, r *rand.Rand) bool {
	a := 2 + r.Int63n(n-4)
	x := modPow(a, d, n)
	if x == 1 || x == n-1 {
		return true
	}
	for d != n-1 {
		x = x * x % n
		d *= 2
		if x == 1 {
			return false
		}
		if x == n-1 {
			return true
		}
	}
	return false
}

func isPrimeMillerRabin(n int64, iterations int) bool {
	if n <= 1 || n == 4 {
		return false
	}
	if n <= 3 {
		return true
	}
	d := n - 1
	for d%2 == 0 {
		d /= 2
	}
	r := rand.New(rand.NewSource(42))
	for i := 0; i < iterations; i++ {
		if !millerRabinTest(n, d, r) {
			return false
		}
	}
	return true
}

func main() {
	candidates := []int64{2, 15, 97, 561, 7919, 104729, 1000000007}
	for _, c := range candidates {
		fmt.Println(c, isPrimeMillerRabin(c, 5))
	}
}
