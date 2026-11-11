package main

import "fmt"

func singleNumber(nums []int) int {
	acc := 0
	for _, n := range nums {
		acc ^= n
	}
	return acc
}

func main() {
	fmt.Println(singleNumber([]int{4, 1, 2, 1, 2})) // 4
}
