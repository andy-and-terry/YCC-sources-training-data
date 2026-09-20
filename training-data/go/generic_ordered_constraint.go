package main

import (
	"cmp"
	"fmt"
	"slices"
)

// MinOf and MaxOf work for any type satisfying cmp.Ordered (integers,
// floats, and strings), showing Go's standard-library generic constraint
// rather than a hand-rolled one.
func MinOf[T cmp.Ordered](items []T) T {
	best := items[0]
	for _, item := range items[1:] {
		if item < best {
			best = item
		}
	}
	return best
}

func MaxOf[T cmp.Ordered](items []T) T {
	best := items[0]
	for _, item := range items[1:] {
		if item > best {
			best = item
		}
	}
	return best
}

func main() {
	nums := []int{5, 3, 9, 1, 7}
	fmt.Println("min:", MinOf(nums), "max:", MaxOf(nums))

	words := []string{"pear", "apple", "banana"}
	fmt.Println("min:", MinOf(words), "max:", MaxOf(words))

	// slices.Sort and slices.SortFunc are also constrained on cmp.Ordered.
	sorted := slices.Clone(nums)
	slices.Sort(sorted)
	fmt.Println("sorted:", sorted)

	slices.SortFunc(words, func(a, b string) int {
		return cmp.Compare(len(a), len(b))
	})
	fmt.Println("by length:", words)
}
