package main

import (
	"fmt"
	"math/bits"
)

func isPow2(n uint) bool { return n != 0 && n&(n-1) == 0 }

func main() {
	x := uint(0b101100)
	fmt.Println("popcount:", bits.OnesCount(x))
	fmt.Println("trailing zeros:", bits.TrailingZeros(x))
	fmt.Println("bit length:", bits.Len(x))
	fmt.Println("lowest set bit:", x&-x)
	fmt.Println("clear lowest:", x&(x-1))
	fmt.Println("pow2:", isPow2(64), isPow2(65))
	a, b := 5, 9
	a ^= b
	b ^= a
	a ^= b
	fmt.Println(a, b)
}
