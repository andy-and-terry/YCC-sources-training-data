package main

import (
	"fmt"
	"math/bits"
)

func isPowerOfTwo(n uint) bool { return n != 0 && n&(n-1) == 0 }

func countBits(n uint) int {
	c := 0
	for ; n != 0; n &= n - 1 {
		c++
	}
	return c
}

func main() {
	var x uint = 0b101100
	fmt.Println(isPowerOfTwo(64), isPowerOfTwo(65))
	fmt.Println(countBits(x), bits.OnesCount(x))
	fmt.Println(bits.TrailingZeros(x), bits.Len(x))
	fmt.Printf("%b\n", x&^0b100)
}
