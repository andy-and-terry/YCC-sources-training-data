package main

import (
	"fmt"
	"unicode/utf8"
)

func main() {
	s := "héllo, 世界"
	fmt.Println("bytes:", len(s), "runes:", utf8.RuneCountInString(s))
	for i, r := range s {
		fmt.Printf("%d:%c(%U) ", i, r, r)
	}
	fmt.Println()
	runes := []rune(s)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}
	fmt.Println(string(runes))
}
