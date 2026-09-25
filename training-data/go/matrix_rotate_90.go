package main

import "fmt"

func rotateCW[T any](m [][]T) [][]T {
	rows, cols := len(m), len(m[0])
	out := make([][]T, cols)
	for c := range out {
		out[c] = make([]T, rows)
		for r := 0; r < rows; r++ {
			out[c][rows-1-r] = m[r][c]
		}
	}
	return out
}

func main() {
	m := [][]int{{1, 2, 3, 4}, {5, 6, 7, 8}}
	r := rotateCW(m)
	for _, row := range r {
		fmt.Println(row)
	}
	full := rotateCW(rotateCW(rotateCW(r)))
	fmt.Println("four rotations restore original:", fmt.Sprint(full) == fmt.Sprint(m))
	letters := [][]rune{[]rune("ab"), []rune("cd")}
	for _, row := range rotateCW(letters) {
		fmt.Println(string(row))
	}
}
