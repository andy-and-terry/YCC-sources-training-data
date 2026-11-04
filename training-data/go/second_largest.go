package main

import (
	"fmt"
	"math"
)

// secondLargest returns the second largest distinct value in one pass.
func secondLargest(xs []int) (int, bool) {
	first, second := math.MinInt, math.MinInt
	for _, x := range xs {
		switch {
		case x > first:
			first, second = x, first
		case x > second && x != first:
			second = x
		}
	}
	return second, second != math.MinInt
}

func main() {
	fmt.Println(secondLargest([]int{4, 9, 2, 9, 7}))
	fmt.Println(secondLargest([]int{3, 3}))
}
