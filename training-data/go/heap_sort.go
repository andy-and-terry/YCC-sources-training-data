package main

import "fmt"

func siftDown(arr []int, start, end int) {
	root := start
	for 2*root+1 <= end {
		child := 2*root + 1
		if child+1 <= end && arr[child] < arr[child+1] {
			child++
		}
		if arr[root] < arr[child] {
			arr[root], arr[child] = arr[child], arr[root]
			root = child
		} else {
			return
		}
	}
}

func heapSort(items []int) []int {
	arr := append([]int(nil), items...)
	n := len(arr)
	for start := n/2 - 1; start >= 0; start-- {
		siftDown(arr, start, n-1)
	}
	for end := n - 1; end > 0; end-- {
		arr[0], arr[end] = arr[end], arr[0]
		siftDown(arr, 0, end-1)
	}
	return arr
}

func main() {
	fmt.Println(heapSort([]int{5, 3, 8, 1, 9, 2}))
}
