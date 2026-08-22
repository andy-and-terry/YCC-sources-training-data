package main

import "fmt"

func bubbleSort(items []int) []int {
	arr := append([]int(nil), items...)
	for i := 0; i < len(arr); i++ {
		swapped := false
		for j := 0; j < len(arr)-i-1; j++ {
			if arr[j] > arr[j+1] {
				arr[j], arr[j+1] = arr[j+1], arr[j]
				swapped = true
			}
		}
		if !swapped {
			break
		}
	}
	return arr
}

func main() {
	fmt.Println(bubbleSort([]int{5, 3, 8, 1, 9, 2}))
}
