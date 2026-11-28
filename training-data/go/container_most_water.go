package main

import "fmt"

func maxArea(h []int) int {
	lo, hi, best := 0, len(h)-1, 0
	for lo < hi {
		w := hi - lo
		m := min(h[lo], h[hi])
		best = max(best, m*w)
		if h[lo] < h[hi] {
			lo++
		} else {
			hi--
		}
	}
	return best
}

func main() {
	fmt.Println(maxArea([]int{1, 8, 6, 2, 5, 4, 8, 3, 7})) // 49
}
