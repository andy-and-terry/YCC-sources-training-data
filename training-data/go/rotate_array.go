package main

import "fmt"

func rotate(nums []int, k int) []int {
	n := len(nums)
	k = ((k % n) + n) % n
	result := make([]int, n)
	for i, x := range nums {
		result[(i+k)%n] = x
	}
	return result
}

func main() {
	fmt.Println(rotate([]int{1, 2, 3, 4, 5, 6, 7}, 3))
}
