package main

import "fmt"

// Hamming numbers (5-smooth), built by merging the x2, x3, x5 streams
func min3(a, b, c int) int {
	m := a
	if b < m {
		m = b
	}
	if c < m {
		m = c
	}
	return m
}

func main() {
	h := []int{1}
	i2, i3, i5 := 0, 0, 0
	for len(h) < 20 {
		next := min3(h[i2]*2, h[i3]*3, h[i5]*5)
		h = append(h, next)
		if next == h[i2]*2 {
			i2++
		}
		if next == h[i3]*3 {
			i3++
		}
		if next == h[i5]*5 {
			i5++
		}
	}
	fmt.Println(h)
}
