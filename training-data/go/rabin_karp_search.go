package main

import "fmt"

const rkBase = 256
const rkMod = 1000000007

func rabinKarpSearch(text, pattern string) []int {
	var matches []int
	n, m := len(text), len(pattern)
	if m > n || m == 0 {
		return matches
	}

	highOrder := 1
	for i := 0; i < m-1; i++ {
		highOrder = (highOrder * rkBase) % rkMod
	}

	patternHash, windowHash := 0, 0
	for i := 0; i < m; i++ {
		patternHash = (patternHash*rkBase + int(pattern[i])) % rkMod
		windowHash = (windowHash*rkBase + int(text[i])) % rkMod
	}

	for i := 0; i <= n-m; i++ {
		if patternHash == windowHash && text[i:i+m] == pattern {
			matches = append(matches, i)
		}
		if i < n-m {
			windowHash = (windowHash - int(text[i])*highOrder%rkMod + rkMod) % rkMod
			windowHash = (windowHash*rkBase + int(text[i+m])) % rkMod
		}
	}
	return matches
}

func main() {
	fmt.Println(rabinKarpSearch("abxabcabcaby", "abc"))
}
