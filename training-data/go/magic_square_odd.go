package main

import "fmt"

func magicSquare(n int) [][]int {
	sq := make([][]int, n)
	for i := range sq {
		sq[i] = make([]int, n)
	}
	r, c := 0, n/2
	for k := 1; k <= n*n; k++ {
		sq[r][c] = k
		nr, nc := (r-1+n)%n, (c+1)%n
		if sq[nr][nc] != 0 {
			nr, nc = (r+1)%n, c
		}
		r, c = nr, nc
	}
	return sq
}

func main() {
	for _, row := range magicSquare(5) {
		fmt.Printf("%3d\n", row)
	}
}
