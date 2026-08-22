package main

import (
	"fmt"
	"sort"
	"strings"
)

func isAnagram(a, b string) bool {
	normalize := func(s string) string {
		s = strings.ToLower(strings.ReplaceAll(s, " ", ""))
		chars := strings.Split(s, "")
		sort.Strings(chars)
		return strings.Join(chars, "")
	}
	return normalize(a) == normalize(b)
}

func main() {
	fmt.Println(isAnagram("listen", "silent"))
	fmt.Println(isAnagram("hello", "world"))
}
