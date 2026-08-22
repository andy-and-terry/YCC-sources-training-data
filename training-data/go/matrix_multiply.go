package main

import "fmt"

func multiply(a, b [][]int) [][]int {
	rowsA, colsA, colsB := len(a), len(a[0]), len(b[0])
	result := make([][]int, rowsA)
	for i := range result {
		result[i] = make([]int, colsB)
		for j := 0; j < colsB; j++ {
			sum := 0
			for k := 0; k < colsA; k++ {
				sum += a[i][k] * b[k][j]
			}
			result[i][j] = sum
		}
	}
	return result
}

func main() {
	a := [][]int{{1, 2}, {3, 4}}
	b := [][]int{{5, 6}, {7, 8}}
	fmt.Println(multiply(a, b))
}
