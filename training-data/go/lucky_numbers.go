package main

import "fmt"

func lucky(limit int) []int {
	nums := []int{}
	for n := 1; n < limit; n += 2 {
		nums = append(nums, n)
	}
	for i := 1; i < len(nums) && nums[i] <= len(nums); i++ {
		step := nums[i]
		kept := nums[:0:0]
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
	for _, v := range lucky(100) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
