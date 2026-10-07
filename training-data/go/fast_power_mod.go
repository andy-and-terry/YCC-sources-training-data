package main

import (
	"fmt"
	"math/big"
	"math/bits"
)

func mulMod(a, b, m uint64) uint64 {
	hi, lo := bits.Mul64(a, b)
	_, rem := bits.Div64(hi%m, lo, m)
	return rem
}

func powMod(base, exp, mod uint64) uint64 {
	result := uint64(1) % mod
	base %= mod
	for ; exp > 0; exp >>= 1 {
		if exp&1 == 1 {
			result = mulMod(result, base, mod)
		}
		base = mulMod(base, base, mod)
	}
	return result
}

func main() {
	fmt.Println(powMod(2, 10, 1000), powMod(3, 200, 13), powMod(7, 1e18, 1_000_000_007))
	const p = 18446744073709551557 // largest 64-bit prime
	got := powMod(2, p-1, p)
	want := new(big.Int).Exp(big.NewInt(2), new(big.Int).SetUint64(p-1), new(big.Int).SetUint64(p))
	fmt.Println(got, want)
}
