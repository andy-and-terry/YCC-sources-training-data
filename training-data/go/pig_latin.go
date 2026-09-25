package main

import (
	"fmt"
	"strings"
)

func pigWord(w string) string {
	lower := strings.ToLower(w)
	i := strings.IndexAny(lower, "aeiou")
	switch {
	case i == 0:
		return w + "way"
	case i < 0:
		return w + "ay"
	}
	if lower[i-1] == 'q' && lower[i] == 'u' {
		i++
	}
	return w[i:] + w[:i] + "ay"
}

func main() {
	words := strings.Fields("the quick brown fox jumps over the lazy dog")
	for i, w := range words {
		words[i] = pigWord(w)
	}
	fmt.Println(strings.Join(words, " "))
}
