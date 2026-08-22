package main

import "fmt"

func permutations(items []int) [][]int {
	if len(items) <= 1 {
		return [][]int{items}
	}
	var result [][]int
	for i, chosen := range items {
		rest := make([]int, 0, len(items)-1)
		rest = append(rest, items[:i]...)
		rest = append(rest, items[i+1:]...)
		for _, perm := range permutations(rest) {
			withChosen := append([]int{chosen}, perm...)
			result = append(result, withChosen)
		}
	}
	return result
}

func main() {
	fmt.Println(permutations([]int{1, 2, 3}))
}
