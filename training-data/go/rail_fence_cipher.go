package main

import (
	"fmt"
	"strings"
)

func encode(text string, rails int) string {
	rows := make([][]rune, rails)
	r, step := 0, 1
	for _, ch := range text {
		rows[r] = append(rows[r], ch)
		if r == 0 {
			step = 1
		} else if r == rails-1 {
			step = -1
		}
		r += step
	}
	var b strings.Builder
	for _, row := range rows {
		b.WriteString(string(row))
	}
	return b.String()
}

func main() {
	fmt.Println(encode("WEAREDISCOVERED", 3))
}
