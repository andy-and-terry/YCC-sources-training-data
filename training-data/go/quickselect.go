package main

import "fmt"

func partition(nums []int, low, high int) int {
	pivot := nums[high]
	i := low
	for j := low; j < high; j++ {
		if nums[j] < pivot {
			nums[i], nums[j] = nums[j], nums[i]
			i++
		}
	}
	nums[i], nums[high] = nums[high], nums[i]
	return i
}

// quickselect returns the k-th smallest element (0-indexed) of nums.
func quickselect(nums []int, k int) int {
	low, high := 0, len(nums)-1
	for {
		p := partition(nums, low, high)
		if p == k {
			return nums[p]
		} else if p < k {
			low = p + 1
		} else {
			high = p - 1
		}
	}
}

func main() {
	nums := []int{7, 10, 4, 3, 20, 15}
	fmt.Println("3rd smallest:", quickselect(nums, 2))
}
