package main

import "fmt"

// Lattice paths through an n x n grid with a rolling DP row.
func lattice(n int) int {
	row := make([]int, n+1)
	for i := range row {
		row[i] = 1
	}
	for k := 0; k < n; k++ {
		for j := 1; j <= n; j++ {
			row[j] += row[j-1]
		}
	}
	return row[n]
}

func main() { fmt.Println(lattice(3)) }
