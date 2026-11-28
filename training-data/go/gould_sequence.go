package main

import (
	"fmt"
	"math/bits"
)

func gould(n uint) int {
	return 1 << bits.OnesCount(n)
}

func main() {
	for n := uint(0); n < 16; n++ {
		fmt.Print(gould(n), " ")
	}
	fmt.Println()
}
