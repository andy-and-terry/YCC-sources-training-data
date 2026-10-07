package main

import (
	"fmt"
	"maps"
	"slices"
)

func main() {
	nums := []int{5, 2, 9, 1, 5, 6}
	slices.Sort(nums)
	fmt.Println(nums)

	idx, found := slices.BinarySearch(nums, 6)
	fmt.Println(idx, found)
	fmt.Println(slices.Contains(nums, 9), slices.Index(nums, 2))
	fmt.Println(slices.Max(nums), slices.Min(nums))
	fmt.Println(slices.Compact(slices.Clone(nums)))
	slices.Reverse(nums)
	fmt.Println(nums)

	m := map[string]int{"b": 2, "a": 1, "c": 3}
	keys := slices.Sorted(maps.Keys(m))
	fmt.Println(keys)
	clone := maps.Clone(m)
	delete(clone, "a")
	fmt.Println(len(m), len(clone))
}
