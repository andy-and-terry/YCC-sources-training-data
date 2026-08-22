package main

import "fmt"

func selectionSort(items []int) []int {
	arr := append([]int(nil), items...)
	for i := 0; i < len(arr); i++ {
		minIdx := i
		for j := i + 1; j < len(arr); j++ {
			if arr[j] < arr[minIdx] {
				minIdx = j
			}
		}
		arr[i], arr[minIdx] = arr[minIdx], arr[i]
	}
	return arr
}

func main() {
	fmt.Println(selectionSort([]int{5, 3, 8, 1, 9, 2}))
}
