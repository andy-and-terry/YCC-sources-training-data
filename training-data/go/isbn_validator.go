package main

import (
	"errors"
	"fmt"
	"strings"
)

var (
	errLength   = errors.New("wrong length")
	errChar     = errors.New("invalid character")
	errChecksum = errors.New("checksum mismatch")
)

func validateISBN(raw string) (string, error) {
	s := strings.ToUpper(strings.NewReplacer("-", "", " ", "").Replace(raw))
	switch len(s) {
	case 10:
		total := 0
		for i, c := range s {
			var v int
			switch {
			case c >= '0' && c <= '9':
				v = int(c - '0')
			case c == 'X' && i == 9:
				v = 10
			default:
				return "", errChar
			}
			total += (10 - i) * v
		}
		if total%11 != 0 {
			return "", errChecksum
		}
		return "ISBN-10", nil
	case 13:
		total := 0
		for i, c := range s {
			if c < '0' || c > '9' {
				return "", errChar
			}
			w := 1
			if i%2 == 1 {
				w = 3
			}
			total += int(c-'0') * w
		}
		if total%10 != 0 {
			return "", errChecksum
		}
		return "ISBN-13", nil
	}
	return "", fmt.Errorf("%w: %d", errLength, len(s))
}

func main() {
	for _, s := range []string{"0-306-40615-2", "0-306-40615-3", "978-0-306-40615-7", "0-8044-2957-X", "12345"} {
		kind, err := validateISBN(s)
		fmt.Printf("%-20s %-8s %v\n", s, kind, err)
	}
}
