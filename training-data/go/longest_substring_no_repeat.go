package main

import "fmt"

func longestUnique(s string) string {
	last := map[rune]int{}
	runes := []rune(s)
	start, bestStart, bestLen := 0, 0, 0
	for i, r := range runes {
		if p, ok := last[r]; ok && p >= start {
			start = p + 1
		}
		last[r] = i
		if i-start+1 > bestLen {
			bestStart, bestLen = start, i-start+1
		}
	}
	return string(runes[bestStart : bestStart+bestLen])
}

func main() {
	for _, s := range []string{"abcabcbb", "bbbbb", "pwwkew", "dvdf", "héllo wörld"} {
		r := longestUnique(s)
		fmt.Println(s, r, len([]rune(r)))
	}
}
