package main

import (
	"fmt"
	"slices"
)

func pancakeSort(a []int) (flips []int) {
	for size := len(a); size > 1; size-- {
		maxIdx := 0
		for i := 1; i < size; i++ {
			if a[i] > a[maxIdx] {
				maxIdx = i
			}
		}
		if maxIdx == size-1 {
			continue
		}
		if maxIdx > 0 {
			slices.Reverse(a[:maxIdx+1])
			flips = append(flips, maxIdx+1)
		}
		slices.Reverse(a[:size])
		flips = append(flips, size)
	}
	return flips
}

func main() {
	a := []int{23, 10, 20, 11, 12, 6, 7}
	flips := pancakeSort(a)
	fmt.Println(a, "flips:", flips)
}
