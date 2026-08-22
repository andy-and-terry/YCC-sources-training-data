package main

import "fmt"

func isPalindrome(s string) bool {
	for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
		if s[i] != s[j] {
			return false
		}
	}
	return true
}

func partition(s string) [][]string {
	var result [][]string
	var path []string

	var backtrack func(start int)
	backtrack = func(start int) {
		if start == len(s) {
			result = append(result, append([]string(nil), path...))
			return
		}
		for end := start + 1; end <= len(s); end++ {
			sub := s[start:end]
			if isPalindrome(sub) {
				path = append(path, sub)
				backtrack(end)
				path = path[:len(path)-1]
			}
		}
	}

	backtrack(0)
	return result
}

func main() {
	fmt.Println(partition("aab"))
}
