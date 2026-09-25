package main

import "fmt"

func minPathSum(g [][]int) (int, [][2]int) {
	rows, cols := len(g), len(g[0])
	dp := make([][]int, rows)
	for r := range dp {
		dp[r] = make([]int, cols)
		for c := range dp[r] {
			dp[r][c] = g[r][c]
			switch {
			case r == 0 && c == 0:
			case r == 0:
				dp[r][c] += dp[r][c-1]
			case c == 0:
				dp[r][c] += dp[r-1][c]
			default:
				dp[r][c] += min(dp[r-1][c], dp[r][c-1])
			}
		}
	}
	var path [][2]int
	for r, c := rows-1, cols-1; ; {
		path = append([][2]int{{r, c}}, path...)
		if r == 0 && c == 0 {
			break
		}
		if r == 0 || (c > 0 && dp[r][c-1] < dp[r-1][c]) {
			c--
		} else {
			r--
		}
	}
	return dp[rows-1][cols-1], path
}

func main() {
	cost, path := minPathSum([][]int{{1, 3, 1}, {1, 5, 1}, {4, 2, 1}})
	fmt.Println(cost, path)
}
