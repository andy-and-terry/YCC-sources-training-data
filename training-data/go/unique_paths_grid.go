package main

import (
	"fmt"
	"math/big"
)

func uniquePaths(grid [][]int) uint64 {
	dp := make([]uint64, len(grid[0]))
	if grid[0][0] == 0 {
		dp[0] = 1
	}
	for _, row := range grid {
		for c, v := range row {
			switch {
			case v == 1:
				dp[c] = 0
			case c > 0:
				dp[c] += dp[c-1]
			}
		}
	}
	return dp[len(dp)-1]
}

func main() {
	empty := make([][]int, 3)
	for i := range empty {
		empty[i] = make([]int, 7)
	}
	fmt.Println(uniquePaths(empty), uniquePaths([][]int{{0, 0, 0}, {0, 1, 0}, {0, 0, 0}}))
	fmt.Println("100x100 via binomial:", new(big.Int).Binomial(198, 99))
}
