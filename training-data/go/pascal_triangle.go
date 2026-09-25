package main

import (
	"fmt"
	"strings"
)

func pascal(rows int) [][]uint64 {
	t := make([][]uint64, rows)
	for r := range t {
		t[r] = make([]uint64, r+1)
		t[r][0], t[r][r] = 1, 1
		for i := 1; i < r; i++ {
			t[r][i] = t[r-1][i-1] + t[r-1][i]
		}
	}
	return t
}

func main() {
	t := pascal(10)
	for r, row := range t {
		fmt.Print(strings.Repeat("  ", len(t)-r-1))
		for _, v := range row {
			fmt.Printf("%4d", v)
		}
		fmt.Println()
	}
	// Sierpinski pattern: entries mod 2
	for _, row := range pascal(16) {
		var b strings.Builder
		for _, v := range row {
			if v%2 == 1 {
				b.WriteString("* ")
			} else {
				b.WriteString("  ")
			}
		}
		fmt.Println(b.String())
	}
}
