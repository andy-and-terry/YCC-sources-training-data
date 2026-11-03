package main

import (
	"fmt"
	"strings"
)

func countVowels(s string) map[rune]int {
	result := map[rune]int{}
	for _, r := range strings.ToLower(s) {
		if strings.ContainsRune("aeiou", r) {
			result[r]++
		}
	}
	return result
}

func main() {
	fmt.Println(countVowels("Education is beautiful"))
}
