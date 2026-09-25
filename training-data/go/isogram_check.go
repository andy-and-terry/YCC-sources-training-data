package main

import (
	"fmt"
	"unicode"
)

func isIsogram(s string) bool {
	seen := map[rune]bool{}
	for _, r := range s {
		if !unicode.IsLetter(r) {
			continue
		}
		r = unicode.ToLower(r)
		if seen[r] {
			return false
		}
		seen[r] = true
	}
	return true
}

func main() {
	for _, w := range []string{"lumberjacks", "background", "six-year-old", "isograms"} {
		fmt.Println(w, isIsogram(w))
	}
}
