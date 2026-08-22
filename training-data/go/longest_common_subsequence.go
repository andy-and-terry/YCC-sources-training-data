package main

import "fmt"

func lcs(a, b string) string {
	m, n := len(a), len(b)
	dp := make([][]string, m+1)
	for i := range dp {
		dp[i] = make([]string, n+1)
	}
	for i := 1; i <= m; i++ {
		for j := 1; j <= n; j++ {
			if a[i-1] == b[j-1] {
				dp[i][j] = dp[i-1][j-1] + string(a[i-1])
			} else if len(dp[i-1][j]) >= len(dp[i][j-1]) {
				dp[i][j] = dp[i-1][j]
			} else {
				dp[i][j] = dp[i][j-1]
			}
		}
	}
	return dp[m][n]
}

func main() {
	fmt.Println(lcs("ABCBDAB", "BDCABA"))
}
