package main

import (
	"fmt"
	"maps"
	"slices"
	"strings"
)

func main() {
	nums := []int{5, 2, 8, 1, 9, 3}
	slices.Sort(nums)
	fmt.Println(nums)

	idx, found := slices.BinarySearch(nums, 8)
	fmt.Println(idx, found)
	fmt.Println(slices.Contains(nums, 4), slices.Index(nums, 9))
	fmt.Println(slices.Max(nums), slices.Min(nums))
	rev := slices.Clone(nums)
	slices.Reverse(rev)
	fmt.Println(rev)

	ages := map[string]int{"bob": 25, "alice": 30, "carol": 41}
	keys := slices.Sorted(maps.Keys(ages))
	fmt.Println(strings.Join(keys, ","))

	copyMap := maps.Clone(ages)
	delete(copyMap, "bob")
	fmt.Println(len(ages), len(copyMap), maps.Equal(ages, copyMap))
}
