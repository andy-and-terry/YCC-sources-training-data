package main

import "fmt"

func minSlidingWindow(nums []int, k int) []int {
	var dq []int
	var result []int
	for i, num := range nums {
		for len(dq) > 0 && nums[dq[len(dq)-1]] >= num {
			dq = dq[:len(dq)-1]
		}
		dq = append(dq, i)
		if dq[0] <= i-k {
			dq = dq[1:]
		}
		if i >= k-1 {
			result = append(result, nums[dq[0]])
		}
	}
	return result
}

func main() {
	fmt.Println(minSlidingWindow([]int{1, 3, -1, -3, 5, 3, 6, 7}, 3))
}
