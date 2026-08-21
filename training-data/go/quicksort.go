package main

import "fmt"

func quicksort(items []int) []int {
	if len(items) <= 1 {
		return items
	}
	pivot := items[len(items)/2]
	var left, mid, right []int
	for _, x := range items {
		switch {
		case x < pivot:
			left = append(left, x)
		case x == pivot:
			mid = append(mid, x)
		default:
			right = append(right, x)
		}
	}
	result := quicksort(left)
	result = append(result, mid...)
	result = append(result, quicksort(right)...)
	return result
}

func main() {
	fmt.Println(quicksort([]int{5, 3, 8, 1, 9, 2}))
}
