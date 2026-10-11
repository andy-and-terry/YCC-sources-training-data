package main

import (
	"fmt"
	"strings"
)

func main() {
	htmlEscape := strings.NewReplacer("&", "&amp;", "<", "&lt;", ">", "&gt;", `"`, "&quot;")
	fmt.Println(htmlEscape.Replace(`<a href="x">Tom & Jerry</a>`))

	r := strings.NewReplacer("a", "1", "b", "2", "c", "3")
	fmt.Println(r.Replace("abcabc"))

	fmt.Println(strings.Map(func(r rune) rune {
		if r == 'e' {
			return -1
		}
		return r
	}, "eleven"))
	fmt.Println(strings.Title("go is fun"))
	fmt.Println(strings.EqualFold("Go", "GO"))
}
