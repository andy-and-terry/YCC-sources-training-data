package main

import "fmt"

func centralDelannoy(count int) []int {
	grid := make([][]int, count)
	for m := range grid {
		grid[m] = make([]int, count)
		for n := range grid[m] {
			if m == 0 || n == 0 {
				grid[m][n] = 1
			} else {
				grid[m][n] = grid[m-1][n] + grid[m][n-1] + grid[m-1][n-1]
			}
		}
	}
	out := make([]int, count)
	for k := range out {
		out[k] = grid[k][k]
	}
	return out
}

func main() {
	for _, v := range centralDelannoy(10) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
