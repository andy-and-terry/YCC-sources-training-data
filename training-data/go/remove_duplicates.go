package main

import "fmt"

func removeDuplicatesOrdered(items []int) []int {
	seen := make(map[int]bool)
	var result []int
	for _, x := range items {
		if !seen[x] {
			seen[x] = true
			result = append(result, x)
		}
	}
	return result
}

func main() {
	fmt.Println(removeDuplicatesOrdered([]int{1, 2, 2, 3, 1, 4}))
}
