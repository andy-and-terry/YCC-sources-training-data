package main

import (
	"fmt"
	"strings"
)

func zigzag(s string, rows int) string {
	if rows == 1 || rows >= len(s) {
		return s
	}
	lines := make([]strings.Builder, rows)
	r, step := 0, 1
	for _, ch := range s {
		lines[r].WriteRune(ch)
		if r == 0 {
			step = 1
		} else if r == rows-1 {
			step = -1
		}
		r += step
	}
	var out strings.Builder
	for i := range lines {
		out.WriteString(lines[i].String())
	}
	return out.String()
}

func main() {
	fmt.Println(zigzag("PAYPALISHIRING", 3))
}
