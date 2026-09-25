package main

import "fmt"

func maxProduct(nums []int) int {
	best, hi, lo := nums[0], nums[0], nums[0]
	for _, x := range nums[1:] {
		if x < 0 {
			hi, lo = lo, hi
		}
		hi = max(x, hi*x)
		lo = min(x, lo*x)
		best = max(best, hi)
	}
	return best
}

func main() {
	fmt.Println(maxProduct([]int{2, 3, -2, 4}), maxProduct([]int{-2, 0, -1}), maxProduct([]int{-2, 3, -4}))
}
