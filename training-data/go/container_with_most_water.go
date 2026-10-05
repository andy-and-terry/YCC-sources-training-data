package main

import "fmt"

func maxArea(height []int) int {
	best := 0
	l, r := 0, len(height)-1
	for l < r {
		h := min(height[l], height[r])
		if area := h * (r - l); area > best {
			best = area
		}
		if height[l] < height[r] {
			l++
		} else {
			r--
		}
	}
	return best
}

func main() {
	fmt.Println(maxArea([]int{1, 8, 6, 2, 5, 4, 8, 3, 7}))
}
