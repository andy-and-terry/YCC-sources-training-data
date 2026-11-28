package main

import (
	"fmt"
	"sort"
)

func main() {
	a := []int{10, 9, 2, 5, 3, 7, 101, 18}
	var tails []int
	for _, x := range a {
		i := sort.SearchInts(tails, x)
		if i == len(tails) {
			tails = append(tails, x)
		} else {
			tails[i] = x
		}
	}
	fmt.Println(len(tails))
}
