package main

import (
	"fmt"
	"math/big"
)

func ways(n int, steps []int) *big.Int {
	dp := make([]*big.Int, n+1)
	dp[0] = big.NewInt(1)
	for i := 1; i <= n; i++ {
		dp[i] = new(big.Int)
		for _, s := range steps {
			if s <= i {
				dp[i].Add(dp[i], dp[i-s])
			}
		}
	}
	return dp[n]
}

func minCost(cost []int) int {
	a, b := 0, 0
	for _, c := range cost {
		a, b = b, min(a, b)+c
	}
	return min(a, b)
}

func main() {
	for n := 1; n <= 10; n++ {
		fmt.Print(ways(n, []int{1, 2}), " ")
	}
	fmt.Println()
	fmt.Println(ways(200, []int{1, 2}), ways(10, []int{1, 3, 5}))
	fmt.Println(minCost([]int{1, 100, 1, 1, 1, 100, 1, 1, 100, 1}))
}
