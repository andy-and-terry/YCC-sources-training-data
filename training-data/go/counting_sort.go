package main

import "fmt"

func countingSort(items []int) []int {
	if len(items) == 0 {
		return items
	}
	max := items[0]
	for _, x := range items {
		if x > max {
			max = x
		}
	}
	counts := make([]int, max+1)
	for _, x := range items {
		counts[x]++
	}
	result := make([]int, 0, len(items))
	for value, count := range counts {
		for i := 0; i < count; i++ {
			result = append(result, value)
		}
	}
	return result
}

func main() {
	fmt.Println(countingSort([]int{5, 3, 8, 1, 9, 2, 3}))
}
