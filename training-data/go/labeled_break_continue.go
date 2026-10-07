package main

import "fmt"

func findPair(grid [][]int, target int) (int, int, bool) {
	for i, row := range grid {
		for j, v := range row {
			if v == target {
				return i, j, true
			}
		}
	}
	return 0, 0, false
}

func main() {
	grid := [][]int{
		{1, 2, 3},
		{4, -1, 6},
		{7, 8, 9},
	}

	// continue outer: skip an entire row once a negative number is seen.
	total := 0
rows:
	for _, row := range grid {
		for _, v := range row {
			if v < 0 {
				continue rows
			}
			total += v
		}
	}
	fmt.Println("sum of clean rows:", total)

	// break outer: stop everything once the running sum passes a limit.
	sum := 0
outer:
	for _, row := range grid {
		for _, v := range row {
			sum += v
			if sum > 15 {
				break outer
			}
		}
	}
	fmt.Println("stopped at sum:", sum)

	i, j, ok := findPair(grid, 8)
	fmt.Println(i, j, ok)
}
