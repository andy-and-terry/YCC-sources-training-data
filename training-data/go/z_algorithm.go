package main

import "fmt"

func zArray(s string) []int {
	n := len(s)
	z := make([]int, n)
	l, r := 0, 0
	for i := 1; i < n; i++ {
		if i < r {
			z[i] = min(r-i, z[i-l])
		}
		for i+z[i] < n && s[z[i]] == s[i+z[i]] {
			z[i]++
		}
		if i+z[i] > r {
			l, r = i, i+z[i]
		}
	}
	return z
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func zSearch(text, pattern string) []int {
	combined := pattern + "\x00" + text
	z := zArray(combined)
	var matches []int
	for i, v := range z {
		if v == len(pattern) {
			matches = append(matches, i-len(pattern)-1)
		}
	}
	return matches
}

func main() {
	fmt.Println(zArray("aabxaabxcaabx"))
	fmt.Println(zSearch("abxabcabcaby", "abcaby"))
}
