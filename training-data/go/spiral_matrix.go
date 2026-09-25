package main

import "fmt"

func spiral(n int) [][]int {
	g := make([][]int, n)
	for i := range g {
		g[i] = make([]int, n)
	}
	top, left, bottom, right, k := 0, 0, n-1, n-1, 1
	for top <= bottom && left <= right {
		for c := left; c <= right; c++ {
			g[top][c] = k
			k++
		}
		top++
		for r := top; r <= bottom; r++ {
			g[r][right] = k
			k++
		}
		right--
		if top <= bottom {
			for c := right; c >= left; c-- {
				g[bottom][c] = k
				k++
			}
			bottom--
		}
		if left <= right {
			for r := bottom; r >= top; r-- {
				g[r][left] = k
				k++
			}
			left++
		}
	}
	return g
}

func main() {
	for _, row := range spiral(4) {
		fmt.Println(row)
	}
}
