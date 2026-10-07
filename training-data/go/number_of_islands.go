package main

import "fmt"

func numIslands(grid [][]byte) int {
	rows := len(grid)
	if rows == 0 {
		return 0
	}
	cols := len(grid[0])

	var flood func(r, c int)
	flood = func(r, c int) {
		if r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] != '1' {
			return
		}
		grid[r][c] = '0'
		flood(r+1, c)
		flood(r-1, c)
		flood(r, c+1)
		flood(r, c-1)
	}

	count := 0
	for r := 0; r < rows; r++ {
		for c := 0; c < cols; c++ {
			if grid[r][c] == '1' {
				count++
				flood(r, c)
			}
		}
	}
	return count
}

func main() {
	grid := [][]byte{
		[]byte("11000"),
		[]byte("11000"),
		[]byte("00100"),
		[]byte("00011"),
	}
	fmt.Println("islands:", numIslands(grid))
}
