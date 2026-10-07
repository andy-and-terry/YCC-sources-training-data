package main

import (
	"fmt"
	"math/big"
	"math/bits"
)

// isqrt computes floor(sqrt(n)) digit-by-digit in base 4.
func isqrt(n uint64) uint64 {
	var res uint64
	bit := uint64(1) << 62
	for bit > n {
		bit >>= 2
	}
	for ; bit != 0; bit >>= 2 {
		if n >= res+bit {
			n -= res + bit
			res = res>>1 + bit
		} else {
			res >>= 1
		}
	}
	return res
}

func main() {
	for _, n := range []uint64{0, 1, 15, 16, 17, 1 << 40, ^uint64(0)} {
		fmt.Printf("isqrt(%d) = %d\n", n, isqrt(n))
	}
	big1 := new(big.Int).Exp(big.NewInt(10), big.NewInt(50), nil)
	fmt.Println("big sqrt(10^50) =", new(big.Int).Sqrt(big1), "bits:", bits.Len64(isqrt(^uint64(0))))
}
