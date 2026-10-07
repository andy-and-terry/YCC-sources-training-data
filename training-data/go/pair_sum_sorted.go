package main

import "fmt"

func pairWithSum(nums []int, target int) (int, int, bool) {
	i, j := 0, len(nums)-1
	for i < j {
		switch s := nums[i] + nums[j]; {
		case s == target:
			return i, j, true
		case s < target:
			i++
		default:
			j--
		}
	}
	return 0, 0, false
}

func main() {
	fmt.Println(pairWithSum([]int{1, 3, 4, 6, 8, 11}, 10))
	fmt.Println(pairWithSum([]int{1, 2, 3}, 100))
}
