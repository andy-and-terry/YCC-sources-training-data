package main

import "fmt"

func minutesToRot(input [][]int) int {
	g := make([][]int, len(input))
	type pt struct{ r, c int }
	var frontier []pt
	fresh := 0
	for r := range input {
		g[r] = append([]int(nil), input[r]...)
		for c, v := range g[r] {
			if v == 2 {
				frontier = append(frontier, pt{r, c})
			} else if v == 1 {
				fresh++
			}
		}
	}
	minutes := 0
	for len(frontier) > 0 && fresh > 0 {
		var next []pt
		for _, p := range frontier {
			for _, d := range []pt{{1, 0}, {-1, 0}, {0, 1}, {0, -1}} {
				r, c := p.r+d.r, p.c+d.c
				if r >= 0 && c >= 0 && r < len(g) && c < len(g[r]) && g[r][c] == 1 {
					g[r][c] = 2
					fresh--
					next = append(next, pt{r, c})
				}
			}
		}
		frontier = next
		minutes++
	}
	if fresh > 0 {
		return -1
	}
	return minutes
}

func main() {
	fmt.Println(minutesToRot([][]int{{2, 1, 1}, {1, 1, 0}, {0, 1, 1}}), minutesToRot([][]int{{2, 1, 1}, {0, 1, 1}, {1, 0, 1}}))
}
