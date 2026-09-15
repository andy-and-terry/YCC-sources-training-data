package main

import "fmt"

func rabinKarpSearch(text, pattern string) []int {
	const base = 256
	const mod = 1000000007
	n, m := len(text), len(pattern)
	var matches []int
	if m == 0 || m > n {
		return matches
	}

	var highOrder int64 = 1
	for i := 0; i < m-1; i++ {
		highOrder = (highOrder * base) % mod
	}

	var patternHash, windowHash int64
	for i := 0; i < m; i++ {
		patternHash = (patternHash*base + int64(pattern[i])) % mod
		windowHash = (windowHash*base + int64(text[i])) % mod
	}

	for i := 0; ; i++ {
		if windowHash == patternHash && text[i:i+m] == pattern {
			matches = append(matches, i)
		}
		if i+m >= n {
			break
		}
		windowHash = (windowHash - int64(text[i])*highOrder%mod + mod) % mod
		windowHash = (windowHash*base + int64(text[i+m])) % mod
	}
	return matches
}

func main() {
	fmt.Println(rabinKarpSearch("abxabcabcaby", "abcaby"))
	fmt.Println(rabinKarpSearch("aaaaa", "aa"))
}
