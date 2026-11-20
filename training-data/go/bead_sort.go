package main

import "fmt"

// Bead (gravity) sort for non-negative integers.
func beadSort(nums []int) []int {
	max := 0
	for _, n := range nums {
		if n > max {
			max = n
		}
	}
	cols := make([]int, max)
	for _, n := range nums {
		for i := 0; i < n; i++ {
			cols[i]++
		}
	}
	out := make([]int, len(nums))
	for r := range nums {
		c := 0
		for _, v := range cols {
			if v > r {
				c++
			}
		}
		out[len(nums)-1-r] = c
	}
	return out
}

func main() { fmt.Println(beadSort([]int{5, 3, 1, 4, 2})) }
