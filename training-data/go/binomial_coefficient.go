package main

import (
	"fmt"
	"math/big"
)

type binom struct {
	mod       uint64
	fact, inv []uint64
}

func powMod(b, e, m uint64) uint64 {
	r := uint64(1)
	for b %= m; e > 0; e >>= 1 {
		if e&1 == 1 {
			r = r * b % m
		}
		b = b * b % m
	}
	return r
}

func newBinom(n int, mod uint64) *binom {
	b := &binom{mod, make([]uint64, n+1), make([]uint64, n+1)}
	b.fact[0] = 1
	for i := 1; i <= n; i++ {
		b.fact[i] = b.fact[i-1] * uint64(i) % mod
	}
	b.inv[n] = powMod(b.fact[n], mod-2, mod)
	for i := n; i > 0; i-- {
		b.inv[i-1] = b.inv[i] * uint64(i) % mod
	}
	return b
}

func (b *binom) choose(n, k int) uint64 {
	if k < 0 || k > n {
		return 0
	}
	return b.fact[n] * b.inv[k] % b.mod * b.inv[n-k] % b.mod
}

func main() {
	b := newBinom(1_000_000, 1_000_000_007)
	exact := new(big.Int).Binomial(1000, 500)
	fmt.Println(b.choose(1000, 500), new(big.Int).Mod(exact, big.NewInt(1_000_000_007)))
	fmt.Println(new(big.Int).Binomial(52, 5), b.choose(1_000_000, 123_456))
}
