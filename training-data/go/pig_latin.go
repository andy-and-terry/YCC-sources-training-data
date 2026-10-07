package main

import (
	"fmt"
	"strings"
)

func isVowel(b byte) bool { return strings.IndexByte("aeiou", b) >= 0 }

func translateWord(w string) string {
	if isVowel(w[0]) || strings.HasPrefix(w, "xr") || strings.HasPrefix(w, "yt") {
		return w + "ay"
	}
	for i := 1; i < len(w); i++ {
		if w[i] == 'u' && w[i-1] == 'q' {
			return w[i+1:] + w[:i+1] + "ay"
		}
		if isVowel(w[i]) || w[i] == 'y' {
			return w[i:] + w[:i] + "ay"
		}
	}
	return w + "ay"
}

func main() {
	var out []string
	for _, w := range strings.Fields("quick fast run apple rhythm square") {
		out = append(out, translateWord(w))
	}
	fmt.Println(strings.Join(out, " "))
}
