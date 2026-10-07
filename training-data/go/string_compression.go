package main

import (
	"fmt"
	"strconv"
	"strings"
	"unicode"
)

func compress(s string) string {
	var b strings.Builder
	r := []rune(s)
	for i := 0; i < len(r); {
		j := i
		for j < len(r) && r[j] == r[i] {
			j++
		}
		b.WriteRune(r[i])
		b.WriteString(strconv.Itoa(j - i))
		i = j
	}
	if b.Len() < len(s) {
		return b.String()
	}
	return s
}

func decompress(s string) string {
	var b strings.Builder
	r := []rune(s)
	for i := 0; i < len(r); {
		c := r[i]
		i++
		start := i
		for i < len(r) && unicode.IsDigit(r[i]) {
			i++
		}
		n, _ := strconv.Atoi(string(r[start:i]))
		b.WriteString(strings.Repeat(string(c), n))
	}
	return b.String()
}

func main() {
	for _, w := range []string{"aabcccccaaa", "abc", "zzzzzzzzzzzz"} {
		c := compress(w)
		fmt.Println(w, "->", c, c == w || decompress(c) == w)
	}
}
