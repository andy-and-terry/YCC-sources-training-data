package main

import (
	"fmt"
	"unicode"
)

func swapCase(s string) string {
	out := []rune(s)
	for i, r := range out {
		if unicode.IsUpper(r) {
			out[i] = unicode.ToLower(r)
		} else {
			out[i] = unicode.ToUpper(r)
		}
	}
	return string(out)
}

func main() {
	fmt.Println(swapCase("Hello World 42"))
}
