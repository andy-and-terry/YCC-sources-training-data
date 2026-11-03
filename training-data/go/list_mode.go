package main

import (
	"fmt"
	"sort"
)

func modes(items []int) []int {
	counts := map[int]int{}
	top := 0
	for _, x := range items {
		counts[x]++
		if counts[x] > top {
			top = counts[x]
		}
	}
	var out []int
	for k, c := range counts {
		if c == top {
			out = append(out, k)
		}
	}
	sort.Ints(out)
	return out
}

func main() {
	fmt.Println(modes([]int{1, 2, 2, 3, 3, 4}))
}
