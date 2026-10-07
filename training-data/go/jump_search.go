package main

import (
	"fmt"
	"math"
)

func jumpSearch(a []int, target int) int {
	n := len(a)
	step := max(1, int(math.Sqrt(float64(n))))
	prev := 0
	for prev < n && a[min(prev+step, n)-1] < target {
		prev += step
	}
	for i := prev; i < min(prev+step, n); i++ {
		if a[i] == target {
			return i
		}
	}
	return -1
}

func main() {
	fib := []int{0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610}
	fmt.Println(jumpSearch(fib, 55), jumpSearch(fib, 4))
}
