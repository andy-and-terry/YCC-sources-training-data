package main

import "fmt"

func main() {
	grid := [][]int{
		{1, 2, 3},
		{4, 5, 6},
		{7, 8, 9},
	}

	target := 5
outer:
	for r, row := range grid {
		for c, v := range row {
			if v == target {
				fmt.Printf("found %d at (%d,%d)\n", v, r, c)
				break outer
			}
		}
	}

	sum := 0
rows:
	for _, row := range grid {
		for _, v := range row {
			if v%2 == 0 {
				continue rows
			}
			sum += v
		}
	}
	fmt.Println("sum of leading odd values per row:", sum)
}
