package main

import "fmt"

func setZeroes(m [][]int) {
	rows, cols := map[int]bool{}, map[int]bool{}
	for r, row := range m {
		for c, v := range row {
			if v == 0 {
				rows[r], cols[c] = true, true
			}
		}
	}
	for r, row := range m {
		for c := range row {
			if rows[r] || cols[c] {
				row[c] = 0
			}
		}
	}
}

func main() {
	m := [][]int{{0, 1, 2, 0}, {3, 4, 5, 2}, {1, 3, 1, 5}}
	setZeroes(m)
	for _, row := range m {
		fmt.Println(row)
	}
}
