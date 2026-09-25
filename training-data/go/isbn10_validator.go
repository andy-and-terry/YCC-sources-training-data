package main

import (
	"fmt"
	"strings"
)

func isValidISBN10(isbn string) bool {
	s := strings.ReplaceAll(isbn, "-", "")
	if len(s) != 10 {
		return false
	}
	total := 0
	for i, c := range s {
		var v int
		switch {
		case c >= '0' && c <= '9':
			v = int(c - '0')
		case c == 'X' && i == 9:
			v = 10
		default:
			return false
		}
		total += v * (10 - i)
	}
	return total%11 == 0
}

func main() {
	for _, s := range []string{"3-598-21508-8", "3-598-21507-X", "3-598-21508-9"} {
		fmt.Println(s, isValidISBN10(s))
	}
}
