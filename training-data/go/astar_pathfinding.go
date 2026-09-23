package main

import "fmt"

type point struct {
	x, y int
}

func heuristic(a, b point) int {
	dx := a.x - b.x
	if dx < 0 {
		dx = -dx
	}
	dy := a.y - b.y
	if dy < 0 {
		dy = -dy
	}
	return dx + dy
}

func neighbors(p point, grid [][]int) []point {
	candidates := []point{{p.x + 1, p.y}, {p.x - 1, p.y}, {p.x, p.y + 1}, {p.x, p.y - 1}}
	var valid []point
	for _, c := range candidates {
		if c.y >= 0 && c.y < len(grid) && c.x >= 0 && c.x < len(grid[0]) && grid[c.y][c.x] == 0 {
			valid = append(valid, c)
		}
	}
	return valid
}

func aStar(grid [][]int, start, goal point) []point {
	open := map[point]bool{start: true}
	cameFrom := map[point]point{}
	gScore := map[point]int{start: 0}
	fScore := map[point]int{start: heuristic(start, goal)}

	for len(open) > 0 {
		var current point
		best := -1
		for p := range open {
			if best == -1 || fScore[p] < best {
				best = fScore[p]
				current = p
			}
		}
		if current == goal {
			var path []point
			for p := current; ; {
				path = append([]point{p}, path...)
				prev, ok := cameFrom[p]
				if !ok {
					break
				}
				p = prev
			}
			return path
		}
		delete(open, current)

		for _, n := range neighbors(current, grid) {
			tentative := gScore[current] + 1
			if existing, ok := gScore[n]; !ok || tentative < existing {
				cameFrom[n] = current
				gScore[n] = tentative
				fScore[n] = tentative + heuristic(n, goal)
				open[n] = true
			}
		}
	}
	return nil
}

func main() {
	grid := [][]int{
		{0, 0, 0, 0, 0},
		{0, 1, 1, 1, 0},
		{0, 0, 0, 1, 0},
		{1, 1, 0, 1, 0},
		{0, 0, 0, 0, 0},
	}

	path := aStar(grid, point{0, 0}, point{4, 4})
	fmt.Println(path)
	fmt.Println("steps:", len(path)-1)
}
