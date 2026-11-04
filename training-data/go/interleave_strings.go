package main

import (
	"fmt"
	"strings"
)

func interleave(parts ...string) string {
	longest := 0
	for _, p := range parts {
		longest = max(longest, len(p))
	}
	var sb strings.Builder
	for i := 0; i < longest; i++ {
		for _, p := range parts {
			if i < len(p) {
				sb.WriteByte(p[i])
			}
		}
	}
	return sb.String()
}

func main() {
	fmt.Println(interleave("abc", "12345"))
	fmt.Println(interleave("ab", "cd", "efg"))
}
