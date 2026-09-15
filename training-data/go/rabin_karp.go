package main

import "fmt"

func rabinKarpSearch(text, pattern string) []int {
	var matches []int
	n, m := len(text), len(pattern)
	if m == 0 || m > n {
		return matches
	}

	const base = 256
	const mod = 1000000007

	var patternHash, windowHash, highOrder int64 = 0, 0, 1
	for i := 0; i < m-1; i++ {
		highOrder = (highOrder * base) % mod
	}

	for i := 0; i < m; i++ {
		patternHash = (patternHash*base + int64(pattern[i])) % mod
		windowHash = (windowHash*base + int64(text[i])) % mod
	}

	for i := 0; i <= n-m; i++ {
		if patternHash == windowHash && text[i:i+m] == pattern {
			matches = append(matches, i)
		}
		if i < n-m {
			windowHash = (windowHash - int64(text[i])*highOrder%mod + mod*base) % mod
			windowHash = (windowHash*base + int64(text[i+m])) % mod
		}
	}
	return matches
}

func main() {
	fmt.Println(rabinKarpSearch("abxabcabcaby", "abc"))
}
