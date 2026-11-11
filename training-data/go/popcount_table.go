// Population count (number of set bits) for 0..15
package main

import (
	"fmt"
	"math/bits"
)

func main() {
	for n := uint(0); n < 16; n++ {
		fmt.Print(bits.OnesCount(n), " ")
	}
	fmt.Println()
}
