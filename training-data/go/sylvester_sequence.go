package main

import (
	"fmt"
	"math/big"
)

// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
func main() {
	s := big.NewInt(2)
	one := big.NewInt(1)
	for i := 0; i < 8; i++ {
		fmt.Printf("s(%d) = %s\n", i, s)
		sq := new(big.Int).Mul(s, s)
		sq.Sub(sq, s)
		s = sq.Add(sq, one)
	}
}
