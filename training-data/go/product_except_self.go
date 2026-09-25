package main

import "fmt"

func productExceptSelf(nums []int) []int {
	out := make([]int, len(nums))
	prefix := 1
	for i, v := range nums {
		out[i] = prefix
		prefix *= v
	}
	suffix := 1
	for i := len(nums) - 1; i >= 0; i-- {
		out[i] *= suffix
		suffix *= nums[i]
	}
	return out
}

func main() {
	fmt.Println(productExceptSelf([]int{1, 2, 3, 4}), productExceptSelf([]int{-1, 1, 0, -3, 3}))
}
