package main

import (
	"fmt"
	"strings"
)

func main() {
	var sb strings.Builder
	for i := 0; i < 3; i++ {
		fmt.Fprintf(&sb, "[%d]", i)
	}
	fmt.Println(sb.String())
	fmt.Println(strings.Fields("  a  b c "), strings.Repeat("ab", 3))
	fmt.Println(strings.Title("x"), strings.TrimLeft("xxabc", "x"))
}
