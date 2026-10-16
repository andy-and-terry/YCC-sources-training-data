package main

import (
	"fmt"
	"unicode/utf8"
)

func main() {
	good := "日本語"
	bad := "ab\xffcd"
	fmt.Println(utf8.ValidString(good), utf8.ValidString(bad))
	fmt.Println(len(good), utf8.RuneCountInString(good))

	r, size := utf8.DecodeRuneInString(good)
	fmt.Printf("%c %d\n", r, size)
	r, size = utf8.DecodeLastRuneInString(good)
	fmt.Printf("%c %d\n", r, size)

	for i, r := range bad {
		fmt.Printf("%d:%U ", i, r)
	}
	fmt.Println()

	buf := make([]byte, 4)
	n := utf8.EncodeRune(buf, '€')
	fmt.Println(buf[:n], utf8.RuneLen('€'))
}
