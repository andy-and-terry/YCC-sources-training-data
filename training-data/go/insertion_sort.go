package main

import "fmt"

func insertionSort(items []int) []int {
	arr := append([]int(nil), items...)
	for i := 1; i < len(arr); i++ {
		key := arr[i]
		j := i - 1
		for j >= 0 && arr[j] > key {
			arr[j+1] = arr[j]
			j--
		}
		arr[j+1] = key
	}
	return arr
}

func main() {
	fmt.Println(insertionSort([]int{5, 3, 8, 1, 9, 2}))
}
