package main

import "fmt"

// missing finds the absent value in 0..n using XOR cancellation.
func missing(nums []int) int {
	x := len(nums)
	for i, v := range nums {
		x ^= i ^ v
	}
	return x
}

func main() {
	fmt.Println(missing([]int{3, 0, 1}))
	fmt.Println(missing([]int{9, 6, 4, 2, 3, 5, 7, 0, 1}))
}
