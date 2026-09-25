package main

import "fmt"

func exist(board [][]byte, word string) bool {
	var dfs func(r, c, i int) bool
	dfs = func(r, c, i int) bool {
		if i == len(word) {
			return true
		}
		if r < 0 || c < 0 || r >= len(board) || c >= len(board[0]) || board[r][c] != word[i] {
			return false
		}
		tmp := board[r][c]
		board[r][c] = '#'
		defer func() { board[r][c] = tmp }()
		return dfs(r+1, c, i+1) || dfs(r-1, c, i+1) || dfs(r, c+1, i+1) || dfs(r, c-1, i+1)
	}
	for r := range board {
		for c := range board[r] {
			if dfs(r, c, 0) {
				return true
			}
		}
	}
	return false
}

func main() {
	board := [][]byte{[]byte("ABCE"), []byte("SFCS"), []byte("ADEE")}
	for _, w := range []string{"ABCCED", "SEE", "ABCB"} {
		fmt.Println(w, exist(board, w))
	}
}
