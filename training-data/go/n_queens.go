package main

import "fmt"

func solveNQueens(n int) [][]int {
	var solutions [][]int
	columns := make(map[int]bool)
	diagonals := make(map[int]bool)
	antiDiagonals := make(map[int]bool)
	board := make([]int, n)

	var backtrack func(row int)
	backtrack = func(row int) {
		if row == n {
			solution := append([]int(nil), board...)
			solutions = append(solutions, solution)
			return
		}
		for col := 0; col < n; col++ {
			if columns[col] || diagonals[row-col] || antiDiagonals[row+col] {
				continue
			}
			columns[col] = true
			diagonals[row-col] = true
			antiDiagonals[row+col] = true
			board[row] = col
			backtrack(row + 1)
			delete(columns, col)
			delete(diagonals, row-col)
			delete(antiDiagonals, row+col)
		}
	}

	backtrack(0)
	return solutions
}

func main() {
	fmt.Println(len(solveNQueens(6)))
}
