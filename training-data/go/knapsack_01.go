package main

import "fmt"

func knapsack(weights, values []int, capacity int) int {
	n := len(weights)
	dp := make([][]int, n+1)
	for i := range dp {
		dp[i] = make([]int, capacity+1)
	}
	for i := 1; i <= n; i++ {
		for w := 0; w <= capacity; w++ {
			dp[i][w] = dp[i-1][w]
			if weights[i-1] <= w {
				candidate := dp[i-1][w-weights[i-1]] + values[i-1]
				if candidate > dp[i][w] {
					dp[i][w] = candidate
				}
			}
		}
	}
	return dp[n][capacity]
}

func main() {
	fmt.Println(knapsack([]int{1, 3, 4, 5}, []int{1, 4, 5, 7}, 7))
}
