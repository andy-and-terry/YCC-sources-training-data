package main

import "fmt"

type point struct {
	r, c int
}

func solveMaze(maze [][]int, start, end point) []point {
	rows, cols := len(maze), len(maze[0])
	type entry struct {
		pos  point
		path []point
	}
	queue := []entry{{start, []point{start}}}
	visited := map[point]bool{start: true}
	directions := []point{{-1, 0}, {1, 0}, {0, -1}, {0, 1}}

	for len(queue) > 0 {
		e := queue[0]
		queue = queue[1:]
		if e.pos == end {
			return e.path
		}
		for _, d := range directions {
			next := point{e.pos.r + d.r, e.pos.c + d.c}
			if next.r >= 0 && next.r < rows && next.c >= 0 && next.c < cols &&
				maze[next.r][next.c] == 0 && !visited[next] {
				visited[next] = true
				newPath := append(append([]point(nil), e.path...), next)
				queue = append(queue, entry{next, newPath})
			}
		}
	}
	return nil
}

func main() {
	maze := [][]int{
		{0, 1, 0, 0},
		{0, 1, 0, 1},
		{0, 0, 0, 1},
		{1, 1, 0, 0},
	}
	fmt.Println(solveMaze(maze, point{0, 0}, point{3, 3}))
}
