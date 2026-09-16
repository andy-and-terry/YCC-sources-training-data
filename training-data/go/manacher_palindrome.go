package main

import "fmt"

func longestPalindrome(s string) string {
	if len(s) == 0 {
		return ""
	}

	transformed := "^#"
	for _, c := range s {
		transformed += string(c) + "#"
	}
	transformed += "$"

	n := len(transformed)
	p := make([]int, n)
	center, right := 0, 0

	for i := 1; i < n-1; i++ {
		if i < right {
			mirror := 2*center - i
			if right-i < p[mirror] {
				p[i] = right - i
			} else {
				p[i] = p[mirror]
			}
		}
		for transformed[i+p[i]+1] == transformed[i-p[i]-1] {
			p[i]++
		}
		if i+p[i] > right {
			center, right = i, i+p[i]
		}
	}

	maxLen, centerIndex := 0, 0
	for i := 1; i < n-1; i++ {
		if p[i] > maxLen {
			maxLen = p[i]
			centerIndex = i
		}
	}

	start := (centerIndex - maxLen) / 2
	return s[start : start+maxLen]
}

func main() {
	fmt.Println(longestPalindrome("babad"))
	fmt.Println(longestPalindrome("cbbd"))
}
