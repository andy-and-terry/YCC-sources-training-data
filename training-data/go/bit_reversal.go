package main

import (
	"fmt"
	"math/bits"
)

func reverseBits(v uint8) uint8 {
	var r uint8
	for i := 0; i < 8; i++ {
		r = r<<1 | v&1
		v >>= 1
	}
	return r
}

func main() {
	for _, v := range []uint8{1, 6, 13, 128} {
		fmt.Println(v, reverseBits(v), bits.Reverse8(v)) // both agree
	}
}
