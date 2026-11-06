// Fermat primality test; Carmichael number 561 fools it.
package main

import (
	"fmt"
	"math/big"
)

func probablyPrime(n int64) bool {
	if n <= 2 {
		return false
	}
	r := new(big.Int).Exp(big.NewInt(2), big.NewInt(n-1), big.NewInt(n))
	return r.Cmp(big.NewInt(1)) == 0
}

func main() {
	for _, n := range []int64{97, 91, 561} {
		fmt.Println(n, probablyPrime(n))
	}
}
