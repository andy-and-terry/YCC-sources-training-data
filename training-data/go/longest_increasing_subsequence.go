package main

import "fmt"

func lengthOfLIS(nums []int) int {
	var tails []int
	for _, num := range nums {
		low, high := 0, len(tails)
		for low < high {
			mid := (low + high) / 2
			if tails[mid] < num {
				low = mid + 1
			} else {
				high = mid
			}
		}
		if low == len(tails) {
			tails = append(tails, num)
		} else {
			tails[low] = num
		}
	}
	return len(tails)
}

func main() {
	fmt.Println(lengthOfLIS([]int{10, 9, 2, 5, 3, 7, 101, 18}))
}
