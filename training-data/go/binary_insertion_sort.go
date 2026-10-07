package main

import (
	"fmt"
	"sort"
)

func binaryInsertionSort(a []int) {
	for i := 1; i < len(a); i++ {
		key := a[i]
		pos := sort.Search(i, func(j int) bool { return a[j] > key })
		copy(a[pos+1:i+1], a[pos:i])
		a[pos] = key
	}
}

func main() {
	a := []int{37, 23, 0, 17, 12, 72, 31, 46, 100, 88, 54}
	binaryInsertionSort(a)
	fmt.Println(a)
}
