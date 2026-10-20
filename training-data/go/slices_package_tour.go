package main

import (
	"cmp"
	"fmt"
	"slices"
	"strings"
)

type person struct {
	name string
	age  int
}

func main() {
	xs := []int{5, 2, 8, 2, 9}
	slices.Sort(xs)
	fmt.Println(xs, slices.Contains(xs, 8), slices.Index(xs, 8))
	i, found := slices.BinarySearch(xs, 5)
	fmt.Println(i, found, slices.Max(xs), slices.Compact(slices.Clone(xs)))

	ps := []person{{"bo", 30}, {"al", 30}, {"cy", 20}}
	slices.SortFunc(ps, func(a, b person) int {
		return cmp.Or(cmp.Compare(a.age, b.age), strings.Compare(a.name, b.name))
	})
	fmt.Println(ps)
	fmt.Println(slices.Equal(xs, []int{2, 2, 5, 8, 9}))
}
