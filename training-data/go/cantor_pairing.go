package main

import (
	"fmt"
	"math"
)

// Cantor pairing function and its inverse.
func pair(x, y int) int { return (x+y)*(x+y+1)/2 + y }

func unpair(z int) (int, int) {
	w := int((math.Sqrt(float64(8*z+1)) - 1) / 2)
	y := z - w*(w+1)/2
	return w - y, y
}

func main() {
	fmt.Println(pair(3, 4))
	x, y := unpair(32)
	fmt.Println(x, y)
}
