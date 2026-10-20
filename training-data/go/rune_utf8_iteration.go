package main

import (
	"fmt"
	"unicode/utf8"
)

func main() {
	s := "héllo, 世界"
	fmt.Println(len(s), utf8.RuneCountInString(s))
	for i, r := range s {
		if r > 127 {
			fmt.Printf("%d:%c ", i, r)
		}
	}
	fmt.Println()
}
