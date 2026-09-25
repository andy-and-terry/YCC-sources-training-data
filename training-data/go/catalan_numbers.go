package main

import (
	"fmt"
	"math/big"
)

func catalan(n int) []*big.Int {
	c := make([]*big.Int, n+1)
	c[0] = big.NewInt(1)
	for i := 1; i <= n; i++ {
		c[i] = new(big.Int)
		for j := 0; j < i; j++ {
			c[i].Add(c[i], new(big.Int).Mul(c[j], c[i-1-j]))
		}
	}
	return c
}

func catalanBinomial(n int64) *big.Int {
	b := new(big.Int).Binomial(2*n, n)
	return b.Div(b, big.NewInt(n+1))
}

func main() {
	c := catalan(50)
	for _, i := range []int{0, 5, 10, 20, 50} {
		fmt.Printf("C(%d) = %s\n", i, c[i])
	}
	fmt.Println("binomial formula agrees:", c[50].Cmp(catalanBinomial(50)) == 0)
}
