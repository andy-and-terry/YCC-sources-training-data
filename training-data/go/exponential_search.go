package main

import (
	"fmt"
	"sort"
)

func exponentialSearch(a []int, target int) int {
	if len(a) == 0 {
		return -1
	}
	bound := 1
	for bound < len(a) && a[bound] < target {
		bound *= 2
	}
	lo, hi := bound/2, min(bound+1, len(a))
	i := lo + sort.SearchInts(a[lo:hi], target)
	if i < len(a) && a[i] == target {
		return i
	}
	return -1
}

func main() {
	a := make([]int, 67)
	for i := range a {
		a[i] = i * 3
	}
	fmt.Println(exponentialSearch(a, 99), exponentialSearch(a, 100), exponentialSearch(a, 0))
}
