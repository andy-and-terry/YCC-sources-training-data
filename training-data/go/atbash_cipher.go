package main

import (
	"fmt"
	"strings"
	"unicode"
)

func transform(s string) string {
	var b strings.Builder
	for _, r := range strings.ToLower(s) {
		switch {
		case r >= 'a' && r <= 'z':
			b.WriteRune('z' - (r - 'a'))
		case unicode.IsDigit(r):
			b.WriteRune(r)
		}
	}
	return b.String()
}

func encode(s string) string {
	t := transform(s)
	var parts []string
	for i := 0; i < len(t); i += 5 {
		end := min(i+5, len(t))
		parts = append(parts, t[i:end])
	}
	return strings.Join(parts, " ")
}

func main() {
	e := encode("The quick brown fox")
	fmt.Println(e, "->", transform(e))
}
