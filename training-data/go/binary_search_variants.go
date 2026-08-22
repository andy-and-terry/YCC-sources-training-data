package main

import "fmt"

func binarySearch(items []int, target int) int {
	low, high := 0, len(items)-1
	for low <= high {
		mid := (low + high) / 2
		if items[mid] == target {
			return mid
		} else if items[mid] < target {
			low = mid + 1
		} else {
			high = mid - 1
		}
	}
	return -1
}

func lowerBound(items []int, target int) int {
	low, high := 0, len(items)
	for low < high {
		mid := (low + high) / 2
		if items[mid] < target {
			low = mid + 1
		} else {
			high = mid
		}
	}
	return low
}

func main() {
	data := []int{1, 2, 2, 2, 3, 5, 8}
	fmt.Println(binarySearch(data, 5))
	fmt.Println(lowerBound(data, 2))
}
