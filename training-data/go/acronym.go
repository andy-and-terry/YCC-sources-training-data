package main

import (
	"fmt"
	"strings"
	"unicode"
)

func abbreviate(s string) string {
	words := strings.FieldsFunc(s, func(r rune) bool {
		return !unicode.IsLetter(r) && r != '\''
	})
	var b strings.Builder
	for _, w := range words {
		b.WriteRune(unicode.ToUpper([]rune(w)[0]))
	}
	return b.String()
}

func main() {
	fmt.Println(abbreviate("Portable Network Graphics"))
	fmt.Println(abbreviate("Complementary metal-oxide semiconductor"))
}
