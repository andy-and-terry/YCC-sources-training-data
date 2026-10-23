package main

import "fmt"

// trap uses two pointers, always advancing the side with the lower wall.
func trap(h []int) int {
	l, r := 0, len(h)-1
	lmax, rmax, total := 0, 0, 0
	for l < r {
		if h[l] < h[r] {
			lmax = max(lmax, h[l])
			total += lmax - h[l]
			l++
		} else {
			rmax = max(rmax, h[r])
			total += rmax - h[r]
			r--
		}
	}
	return total
}

func main() {
	fmt.Println(trap([]int{0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1}))
	fmt.Println(trap([]int{4, 2, 0, 3, 2, 5}))
	fmt.Println(trap([]int{1, 2, 3}))
}
