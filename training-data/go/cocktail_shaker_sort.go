package main

import (
	"cmp"
	"fmt"
)

func cocktailShakerSort[T cmp.Ordered](a []T) {
	lo, hi := 0, len(a)-1
	for swapped := true; swapped; {
		swapped = false
		for i := lo; i < hi; i++ {
			if a[i] > a[i+1] {
				a[i], a[i+1] = a[i+1], a[i]
				swapped = true
			}
		}
		hi--
		for i := hi; i > lo; i-- {
			if a[i-1] > a[i] {
				a[i-1], a[i] = a[i], a[i-1]
				swapped = true
			}
		}
		lo++
	}
}

func main() {
	nums := []int{5, 1, 4, 2, 8, 0, 2}
	cocktailShakerSort(nums)
	fmt.Println(nums)
	words := []string{"pear", "apple", "fig"}
	cocktailShakerSort(words)
	fmt.Println(words)
}
