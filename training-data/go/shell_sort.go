package main

import "fmt"

func shellSort(items []int) []int {
	arr := append([]int(nil), items...)
	n := len(arr)
	for gap := n / 2; gap > 0; gap /= 2 {
		for i := gap; i < n; i++ {
			temp := arr[i]
			j := i
			for j >= gap && arr[j-gap] > temp {
				arr[j] = arr[j-gap]
				j -= gap
			}
			arr[j] = temp
		}
	}
	return arr
}

func main() {
	fmt.Println(shellSort([]int{5, 3, 8, 1, 9, 2}))
}
