package main

import "fmt"

func maxArea(h []int) (area, left, right int) {
	lo, hi := 0, len(h)-1
	for lo < hi {
		if a := (hi - lo) * min(h[lo], h[hi]); a > area {
			area, left, right = a, lo, hi
		}
		if h[lo] < h[hi] {
			lo++
		} else {
			hi--
		}
	}
	return
}

func main() {
	a, l, r := maxArea([]int{1, 8, 6, 2, 5, 4, 8, 3, 7})
	fmt.Printf("area %d between %d and %d\n", a, l, r)
}
