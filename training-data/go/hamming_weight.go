package main

import (
	"fmt"
	"math/bits"
)

func popcount(n uint64) int {
	c := 0
	for n != 0 {
		n &= n - 1
		c++
	}
	return c
}

func main() {
	fmt.Println(popcount(0b10110111), bits.OnesCount64(0b10110111))
}
