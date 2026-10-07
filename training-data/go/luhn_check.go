package main

import (
	"fmt"
	"strings"
)

func luhnValid(s string) bool {
	s = strings.ReplaceAll(s, " ", "")
	if len(s) < 2 {
		return false
	}
	sum := 0
	for i := 0; i < len(s); i++ {
		c := s[len(s)-1-i]
		if c < '0' || c > '9' {
			return false
		}
		d := int(c - '0')
		if i%2 == 1 {
			d *= 2
			if d > 9 {
				d -= 9
			}
		}
		sum += d
	}
	return sum%10 == 0
}

func main() {
	fmt.Println(luhnValid("4539 3195 0343 6467"), luhnValid("8273 1232 7352 0569"))
}
