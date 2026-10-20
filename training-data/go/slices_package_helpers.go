package main

import (
	"fmt"
	"slices"
)

func main() {
	xs := []int{5, 2, 8, 1}
	slices.Sort(xs)
	i, found := slices.BinarySearch(xs, 5)
	fmt.Println(xs, i, found, slices.Contains(xs, 8), slices.Max(xs))
	slices.Reverse(xs)
	fmt.Println(xs, slices.Index(xs, 2) >= 0)
}
