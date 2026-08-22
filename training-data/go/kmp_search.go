package main

import "fmt"

func buildLPS(pattern string) []int {
	lps := make([]int, len(pattern))
	length := 0
	i := 1
	for i < len(pattern) {
		if pattern[i] == pattern[length] {
			length++
			lps[i] = length
			i++
		} else if length != 0 {
			length = lps[length-1]
		} else {
			lps[i] = 0
			i++
		}
	}
	return lps
}

func kmpSearch(text, pattern string) []int {
	if len(pattern) == 0 {
		return nil
	}
	lps := buildLPS(pattern)
	var matches []int
	i, j := 0, 0
	for i < len(text) {
		if text[i] == pattern[j] {
			i++
			j++
			if j == len(pattern) {
				matches = append(matches, i-j)
				j = lps[j-1]
			}
		} else if j != 0 {
			j = lps[j-1]
		} else {
			i++
		}
	}
	return matches
}

func main() {
	fmt.Println(kmpSearch("abxabcabcaby", "abcaby"))
}
