package main

import "fmt"

func transpose(matrix [][]int) [][]int {
	rows := len(matrix)
	cols := len(matrix[0])
	result := make([][]int, cols)
	for i := range result {
		result[i] = make([]int, rows)
	}
	for i := 0; i < rows; i++ {
		for j := 0; j < cols; j++ {
			result[j][i] = matrix[i][j]
		}
	}
	return result
}

func main() {
	m := [][]int{{1, 2, 3}, {4, 5, 6}}
	fmt.Println(transpose(m))
}
