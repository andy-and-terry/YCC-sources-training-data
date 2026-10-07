package main

import (
	"fmt"
	"strings"
)

func horspool(text, pattern string) []int {
	m, n := len(pattern), len(text)
	if m == 0 || m > n {
		return nil
	}
	var shift [256]int
	for i := range shift {
		shift[i] = m
	}
	for i := 0; i < m-1; i++ {
		shift[pattern[i]] = m - 1 - i
	}
	var out []int
	for i := 0; i <= n-m; i += shift[text[i+m-1]] {
		if text[i:i+m] == pattern {
			out = append(out, i)
		}
	}
	return out
}

func main() {
	text := "here is a simple example, an example indeed"
	fmt.Println(horspool(text, "example"), strings.Index(text, "example"))
}
