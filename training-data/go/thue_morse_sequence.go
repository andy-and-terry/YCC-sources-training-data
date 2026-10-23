package main

import (
	"fmt"
	"math/bits"
)

// Thue-Morse: t(n) is the parity of the number of 1 bits in n
func main() {
	out := make([]byte, 0, 32)
	for n := uint(0); n < 32; n++ {
		out = append(out, byte('0'+bits.OnesCount(n)%2))
	}
	fmt.Println(string(out))
}
