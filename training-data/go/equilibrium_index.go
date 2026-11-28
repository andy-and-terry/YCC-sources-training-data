package main

import "fmt"

func equilibriumIndex(nums []int) int {
	total := 0
	for _, v := range nums {
		total += v
	}
	left := 0
	for i, v := range nums {
		if left == total-left-v {
			return i
		}
		left += v
	}
	return -1
}

func main() {
	fmt.Println(equilibriumIndex([]int{1, 7, 3, 6, 5, 6})) // 3
	fmt.Println(equilibriumIndex([]int{1, 2, 3}))          // -1
}
