package main

import (
	"fmt"
	"unicode"
	"unicode/utf8"
)

func main() {
	s := "héllo, 世界!"
	fmt.Println("bytes:", len(s), "runes:", utf8.RuneCountInString(s))

	for i, r := range s {
		if r > unicode.MaxASCII {
			fmt.Printf("%d: %c (U+%04X)\n", i, r, r)
		}
	}

	letters, spaces, punct := 0, 0, 0
	for _, r := range s {
		switch {
		case unicode.IsLetter(r):
			letters++
		case unicode.IsSpace(r):
			spaces++
		case unicode.IsPunct(r):
			punct++
		}
	}
	fmt.Println(letters, spaces, punct)

	runes := []rune(s)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}
	fmt.Println(string(runes))
}
