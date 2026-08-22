package main

import (
	"fmt"
	"sort"
)

type sortStrategy func([]int) []int

type sortContext struct {
	strategy sortStrategy
}

func (c *sortContext) sort(items []int) []int {
	return c.strategy(items)
}

func ascending(items []int) []int {
	result := append([]int(nil), items...)
	sort.Ints(result)
	return result
}

func descending(items []int) []int {
	result := ascending(items)
	sort.Sort(sort.Reverse(sort.IntSlice(result)))
	return result
}

func main() {
	ctx := &sortContext{strategy: ascending}
	fmt.Println(ctx.sort([]int{5, 3, 8, 1}))
	ctx.strategy = descending
	fmt.Println(ctx.sort([]int{5, 3, 8, 1}))
}
