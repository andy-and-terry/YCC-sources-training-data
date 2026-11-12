package main

import (
	"fmt"
	"maps"
	"slices"
)

func main() {
	xs := []int{3, 1, 2}
	slices.Sort(xs)
	i, found := slices.BinarySearch(xs, 2)
	fmt.Println(xs, i, found, slices.Contains(xs, 9))
	m := map[string]int{"b": 2, "a": 1}
	fmt.Println(slices.Sorted(maps.Keys(m)))
}
