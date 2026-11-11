package main

import "fmt"

func minimumTotal(t [][]int) int {
	dp := append([]int(nil), t[len(t)-1]...)
	for r := len(t) - 2; r >= 0; r-- {
		for i := range t[r] {
			dp[i] = t[r][i] + min(dp[i], dp[i+1])
		}
	}
	return dp[0]
}

func main() {
	fmt.Println(minimumTotal([][]int{{2}, {3, 4}, {6, 5, 7}, {4, 1, 8, 3}})) // 11
}
