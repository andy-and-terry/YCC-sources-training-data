package main

import "fmt"

func lps(s string) int {
	n := len(s)
	if n == 0 {
		return 0
	}
	dp := make([]int, n)
	for i := n - 1; i >= 0; i-- {
		dp[i] = 1
		prev := 0 // dp[i+1][j-1] from the previous row
		for j := i + 1; j < n; j++ {
			tmp := dp[j]
			if s[i] == s[j] {
				dp[j] = prev + 2
			} else {
				dp[j] = max(dp[j], dp[j-1])
			}
			prev = tmp
		}
	}
	return dp[n-1]
}

func main() {
	for _, s := range []string{"bbbab", "character", "agbdba", "racecar", "cbbd"} {
		fmt.Println(s, lps(s), "min insertions:", len(s)-lps(s))
	}
}
