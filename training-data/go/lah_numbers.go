package main

import (
	"fmt"
	"math/big"
)

func lah(n, k int64) *big.Int {
	c := new(big.Int).Binomial(n-1, k-1)
	f := new(big.Int).MulRange(int64(k)+1, n) // n!/k!
	return c.Mul(c, f)
}

func main() {
	for n := int64(1); n <= 5; n++ {
		for k := int64(1); k <= n; k++ {
			fmt.Print(lah(n, k), " ")
		}
		fmt.Println()
	}
}
