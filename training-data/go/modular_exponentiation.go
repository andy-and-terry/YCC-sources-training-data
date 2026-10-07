package main

import "fmt"

func modPow(base, exp, mod int64) int64 {
	result := int64(1)
	base %= mod
	for exp > 0 {
		if exp&1 == 1 {
			result = (result * base) % mod
		}
		exp >>= 1
		base = (base * base) % mod
	}
	return result
}

func main() {
	fmt.Println(modPow(2, 10, 1000000007))
	fmt.Println(modPow(7, 128, 13))
}
