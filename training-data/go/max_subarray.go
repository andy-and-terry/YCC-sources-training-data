package main

import "fmt"

func maxSubarray(nums []int) int {
	best, current := nums[0], nums[0]
	for _, x := range nums[1:] {
		if x > current+x {
			current = x
		} else {
			current = current + x
		}
		if current > best {
			best = current
		}
	}
	return best
}

func main() {
	fmt.Println(maxSubarray([]int{-2, 1, -3, 4, -1, 2, 1, -5, 4}))
}
