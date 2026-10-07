package main

import "fmt"

func islandPerimeter(g [][]int) int {
	at := func(r, c int) int {
		if r < 0 || c < 0 || r >= len(g) || c >= len(g[0]) {
			return 0
		}
		return g[r][c]
	}
	per := 0
	for r := range g {
		for c := range g[r] {
			if g[r][c] == 1 {
				per += 4 - at(r-1, c) - at(r+1, c) - at(r, c-1) - at(r, c+1)
			}
		}
	}
	return per
}

func main() {
	fmt.Println(islandPerimeter([][]int{{0, 1, 0, 0}, {1, 1, 1, 0}, {0, 1, 0, 0}, {1, 1, 0, 0}}))
}
