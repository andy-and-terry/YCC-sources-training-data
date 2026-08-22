package main

import "fmt"

func twoSum(nums []int, target int) [2]int {
	seen := make(map[int]int)
	for i, num := range nums {
		if j, ok := seen[target-num]; ok {
			return [2]int{j, i}
		}
		seen[num] = i
	}
	return [2]int{-1, -1}
}

func main() {
	fmt.Println(twoSum([]int{2, 7, 11, 15}, 9))
}
