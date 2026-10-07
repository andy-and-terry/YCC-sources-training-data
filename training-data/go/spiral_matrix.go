package main

import "fmt"

func spiral(m [][]int) []int {
	var out []int
	if len(m) == 0 {
		return out
	}
	top, bottom, left, right := 0, len(m)-1, 0, len(m[0])-1
	for top <= bottom && left <= right {
		for j := left; j <= right; j++ {
			out = append(out, m[top][j])
		}
		top++
		for i := top; i <= bottom; i++ {
			out = append(out, m[i][right])
		}
		right--
		if top <= bottom {
			for j := right; j >= left; j-- {
				out = append(out, m[bottom][j])
			}
			bottom--
		}
		if left <= right {
			for i := bottom; i >= top; i-- {
				out = append(out, m[i][left])
			}
			left++
		}
	}
	return out
}

func main() {
	fmt.Println(spiral([][]int{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}))
}
