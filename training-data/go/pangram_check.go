package main

import (
	"fmt"
	"unicode"
)

func isPangram(s string) bool {
	var seen uint32
	for _, r := range s {
		r = unicode.ToLower(r)
		if r >= 'a' && r <= 'z' {
			seen |= 1 << (r - 'a')
		}
	}
	return seen == 1<<26-1
}

func main() {
	fmt.Println(isPangram("The quick brown fox jumps over the lazy dog"))
	fmt.Println(isPangram("Hello world"))
}
