package main

import "fmt"

func isToeplitz(m [][]int) bool {
	for i := 1; i < len(m); i++ {
		for j := 1; j < len(m[i]); j++ {
			if m[i][j] != m[i-1][j-1] {
				return false
			}
		}
	}
	return true
}

func main() {
	fmt.Println(isToeplitz([][]int{{1, 2, 3}, {4, 1, 2}, {5, 4, 1}}))
	fmt.Println(isToeplitz([][]int{{1, 2}, {2, 2}}))
}
