package main

import (
	"fmt"
	"math/big"
)

func canPartition(nums []int) bool {
	total := 0
	for _, x := range nums {
		total += x
	}
	if total%2 == 1 {
		return false
	}
	reach := big.NewInt(1)
	for _, x := range nums {
		reach.Or(reach, new(big.Int).Lsh(reach, uint(x)))
	}
	return reach.Bit(total/2) == 1
}

func main() {
	fmt.Println(canPartition([]int{1, 5, 11, 5}), canPartition([]int{1, 2, 3, 5}), canPartition([]int{100, 100, 100, 99, 101}))
}
