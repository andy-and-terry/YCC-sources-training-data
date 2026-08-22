package main

import "fmt"

func hasSubsetSum(nums []int, target int) bool {
	n := len(nums)
	dp := make([][]bool, n+1)
	for i := range dp {
		dp[i] = make([]bool, target+1)
		dp[i][0] = true
	}
	for i := 1; i <= n; i++ {
		for t := 1; t <= target; t++ {
			dp[i][t] = dp[i-1][t]
			if nums[i-1] <= t {
				dp[i][t] = dp[i][t] || dp[i-1][t-nums[i-1]]
			}
		}
	}
	return dp[n][target]
}

func main() {
	fmt.Println(hasSubsetSum([]int{3, 34, 4, 12, 5, 2}, 9))
}
