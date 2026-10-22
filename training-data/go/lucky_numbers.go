package main

import "fmt"

func lucky(limit int) []int {
	nums := []int{}
	for v := 1; v <= limit; v += 2 {
		nums = append(nums, v)
	}
	for i := 1; i < len(nums) && nums[i] <= len(nums); i++ {
		step := nums[i]
		kept := []int{}
		for idx, v := range nums {
			if (idx+1)%step != 0 {
				kept = append(kept, v)
			}
		}
		nums = kept
	}
	return nums
}

func main() {
	for _, v := range lucky(50) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
