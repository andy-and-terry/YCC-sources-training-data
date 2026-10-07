package main

import (
	"fmt"
	"slices"
)

func combinationSum(candidates []int, target int) [][]int {
	c := slices.Clone(candidates)
	slices.Sort(c)
	var out [][]int
	var path []int
	var backtrack func(start, remaining int)
	backtrack = func(start, remaining int) {
		if remaining == 0 {
			out = append(out, slices.Clone(path))
			return
		}
		for i := start; i < len(c) && c[i] <= remaining; i++ {
			path = append(path, c[i])
			backtrack(i, remaining-c[i])
			path = path[:len(path)-1]
		}
	}
	backtrack(0, target)
	return out
}

func main() {
	fmt.Println(combinationSum([]int{2, 3, 6, 7}, 7))
	fmt.Println(combinationSum([]int{2, 3, 5}, 8))
}
