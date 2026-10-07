package main

import "fmt"

func solveMaze(maze [][]int) []string {
	n := len(maze)
	seen := make([][]bool, n)
	for i := range seen {
		seen[i] = make([]bool, n)
	}
	moves := []struct {
		name   byte
		dr, dc int
	}{{'D', 1, 0}, {'L', 0, -1}, {'R', 0, 1}, {'U', -1, 0}}
	var paths []string
	var path []byte
	var dfs func(r, c int)
	dfs = func(r, c int) {
		if r == n-1 && c == n-1 {
			paths = append(paths, string(path))
			return
		}
		seen[r][c] = true
		for _, m := range moves {
			nr, nc := r+m.dr, c+m.dc
			if nr >= 0 && nc >= 0 && nr < n && nc < n && maze[nr][nc] == 1 && !seen[nr][nc] {
				path = append(path, m.name)
				dfs(nr, nc)
				path = path[:len(path)-1]
			}
		}
		seen[r][c] = false
	}
	if maze[0][0] == 1 {
		dfs(0, 0)
	}
	return paths
}

func main() {
	fmt.Println(solveMaze([][]int{{1, 0, 0, 0}, {1, 1, 0, 1}, {1, 1, 0, 0}, {0, 1, 1, 1}}))
}
