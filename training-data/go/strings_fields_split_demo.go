package main

import (
	"fmt"
	"strings"
)

func main() {
	line := "  alpha  beta\tgamma\n delta  "
	fmt.Printf("Fields: %q\n", strings.Fields(line))

	csv := "a,b,,d"
	fmt.Printf("Split: %q\n", strings.Split(csv, ","))
	fmt.Printf("SplitN: %q\n", strings.SplitN(csv, ",", 2))
	fmt.Printf("SplitAfter: %q\n", strings.SplitAfter(csv, ","))

	// FieldsFunc splits on any rune matching the predicate.
	parts := strings.FieldsFunc("one;two,three  four", func(r rune) bool {
		return r == ';' || r == ',' || r == ' '
	})
	fmt.Println(parts, len(parts))

	before, after, found := strings.Cut("key=value=more", "=")
	fmt.Println(before, after, found)

	fmt.Println(strings.Join([]string{"x", "y", "z"}, "-"))
	fmt.Println(strings.TrimFunc("123abc456", func(r rune) bool { return r >= '0' && r <= '9' }))
}
