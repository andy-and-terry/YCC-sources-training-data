package main

import "fmt"

func nextPermutation(nums []int) []int {
	arr := append([]int(nil), nums...)
	i := len(arr) - 2
	for i >= 0 && arr[i] >= arr[i+1] {
		i--
	}
	if i >= 0 {
		j := len(arr) - 1
		for arr[j] <= arr[i] {
			j--
		}
		arr[i], arr[j] = arr[j], arr[i]
	}
	for lo, hi := i+1, len(arr)-1; lo < hi; lo, hi = lo+1, hi-1 {
		arr[lo], arr[hi] = arr[hi], arr[lo]
	}
	return arr
}

func main() {
	fmt.Println(nextPermutation([]int{1, 2, 3}))
	fmt.Println(nextPermutation([]int{3, 2, 1}))
}
