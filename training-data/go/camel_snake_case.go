package main

import (
	"fmt"
	"strings"
	"unicode"
)

func splitWords(s string) []string {
	var words []string
	var cur []rune
	rs := []rune(s)
	flush := func() {
		if len(cur) > 0 {
			words = append(words, strings.ToLower(string(cur)))
			cur = cur[:0]
		}
	}
	for i, r := range rs {
		if r == '_' || r == '-' || r == ' ' {
			flush()
			continue
		}
		if unicode.IsUpper(r) && i > 0 {
			prev := rs[i-1]
			nextLower := i+1 < len(rs) && unicode.IsLower(rs[i+1])
			if unicode.IsLower(prev) || unicode.IsDigit(prev) || (unicode.IsUpper(prev) && nextLower) {
				flush()
			}
		}
		cur = append(cur, r)
	}
	flush()
	return words
}

func toCamel(s string, pascal bool) string {
	words := splitWords(s)
	for i, w := range words {
		if i > 0 || pascal {
			words[i] = strings.ToUpper(w[:1]) + w[1:]
		}
	}
	return strings.Join(words, "")
}

func main() {
	for _, s := range []string{"parseHTTPResponse", "user_id", "background-color", "XMLHttpRequest"} {
		w := splitWords(s)
		fmt.Printf("%-18s %-18s %-18s %s\n", s, toCamel(s, false), strings.Join(w, "_"), strings.ToUpper(strings.Join(w, "_")))
	}
}
