package main

import (
	"fmt"
	"strings"
)

// gnomeSort sorts using the provided less function.
func gnomeSort[T any](a []T, less func(x, y T) bool) {
	for i := 0; i < len(a); {
		if i == 0 || !less(a[i], a[i-1]) {
			i++
		} else {
			a[i], a[i-1] = a[i-1], a[i]
			i--
		}
	}
}

func main() {
	nums := []int{34, 2, 10, -9, 7}
	gnomeSort(nums, func(x, y int) bool { return x < y })
	fmt.Println(nums)
	words := []string{"Delta", "alpha", "Charlie", "bravo"}
	gnomeSort(words, func(x, y string) bool { return strings.ToLower(x) < strings.ToLower(y) })
	fmt.Println(words)
}
