package main

import (
	"fmt"
	"math/bits"
)

func toGray(n uint) uint { return n ^ n>>1 }

func fromGray(g uint) uint {
	for shift := uint(1); shift < 64; shift <<= 1 {
		g ^= g >> shift
	}
	return g
}

func main() {
	prev := uint(0)
	for i := uint(0); i < 16; i++ {
		g := toGray(i)
		flag := ""
		if i > 0 && bits.OnesCount(g^prev) != 1 {
			flag = " !"
		}
		fmt.Printf("%2d %04b %2d%s\n", i, g, fromGray(g), flag)
		prev = g
	}
}
