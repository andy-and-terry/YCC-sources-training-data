package main

import "fmt"

func rodCutting(prices []int, length int) int {
	dp := make([]int, length+1)
	for l := 1; l <= length; l++ {
		best := 0
		for cut := 1; cut <= l; cut++ {
			if cut <= len(prices) {
				candidate := prices[cut-1] + dp[l-cut]
				if candidate > best {
					best = candidate
				}
			}
		}
		dp[l] = best
	}
	return dp[length]
}

func main() {
	prices := []int{1, 5, 8, 9, 10, 17, 17, 20}
	fmt.Println(rodCutting(prices, 8))
}
