package main

import (
	"fmt"
	"sort"
)

func secondLargest(values []int) (int, bool) {
	seen := map[int]bool{}
	var distinct []int
	for _, v := range values {
		if !seen[v] {
			seen[v] = true
			distinct = append(distinct, v)
		}
	}
	if len(distinct) < 2 {
		return 0, false
	}
	sort.Sort(sort.Reverse(sort.IntSlice(distinct)))
	return distinct[1], true
}

func main() {
	fmt.Println(secondLargest([]int{5, 3, 9, 9, 1}))
	fmt.Println(secondLargest([]int{2, 2}))
}
