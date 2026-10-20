package main

import (
	"fmt"
	"strings"
)

func main() {
	var b strings.Builder
	for i, w := range strings.Fields("  the quick  brown fox ") {
		if i > 0 {
			b.WriteByte('-')
		}
		b.WriteString(strings.ToUpper(w[:1]) + w[1:])
	}
	fmt.Println(b.String(), strings.Repeat("ab", 3), strings.TrimLeft("xxhixx", "x"))
}
