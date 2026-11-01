package main

import (
	"fmt"
	"math/bits"
)

// Evil numbers have an even number of 1 bits.
func main() {
	for n := 0; n <= 20; n++ {
		if bits.OnesCount(uint(n))%2 == 0 {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
