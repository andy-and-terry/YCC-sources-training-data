package main

import "fmt"

func powerSet(items []int) [][]int {
	result := [][]int{{}}
	for _, item := range items {
		size := len(result)
		for i := 0; i < size; i++ {
			newSubset := append([]int(nil), result[i]...)
			newSubset = append(newSubset, item)
			result = append(result, newSubset)
		}
	}
	return result
}

func main() {
	fmt.Println(powerSet([]int{1, 2, 3}))
}
