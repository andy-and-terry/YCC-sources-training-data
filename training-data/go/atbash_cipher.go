package main

import (
	"fmt"
	"strings"
)

func atbash(s string) string {
	return strings.Map(func(r rune) rune {
		switch {
		case r >= 'a' && r <= 'z':
			return 'z' - (r - 'a')
		case r >= 'A' && r <= 'Z':
			return 'Z' - (r - 'A')
		}
		return r
	}, s)
}

func main() {
	enc := atbash("Hello, World!")
	fmt.Println(enc, "|", atbash(enc))
}
