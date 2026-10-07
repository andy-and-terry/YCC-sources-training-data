package main

import (
	"fmt"
	"math/bits"
)

func isPowerOfTwo(n uint) bool { return n != 0 && n&(n-1) == 0 }

func main() {
	var x uint = 0b101100
	fmt.Println(bits.OnesCount(x), bits.LeadingZeros(x), bits.TrailingZeros(x))
	fmt.Println(isPowerOfTwo(64), isPowerOfTwo(65))

	x |= 1 << 0
	x &^= 1 << 5
	x ^= 1 << 1
	fmt.Printf("%08b\n", x)
	fmt.Printf("%08b\n", bits.Reverse8(uint8(x)))
	fmt.Println(bits.Len(x), bits.RotateLeft8(0b10000001, 1))
}
