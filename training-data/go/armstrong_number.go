package main

import (
	"fmt"
	"math"
	"strconv"
)

func isArmstrong(n int) bool {
	digits := strconv.Itoa(n)
	power := len(digits)
	sum := 0
	for _, d := range digits {
		digit := int(d - '0')
		sum += int(math.Pow(float64(digit), float64(power)))
	}
	return sum == n
}

func main() {
	for _, n := range []int{153, 9474, 100, 9926315} {
		fmt.Printf("%d is armstrong: %v\n", n, isArmstrong(n))
	}
}
