package main

import "fmt"

// matrixChainOrder returns the minimum number of scalar multiplications
// needed to multiply a chain of matrices whose dimensions are given by
// dims, where matrix i has dimensions dims[i] x dims[i+1].
func matrixChainOrder(dims []int) int {
	n := len(dims) - 1
	dp := make([][]int, n)
	for i := range dp {
		dp[i] = make([]int, n)
	}

	for length := 2; length <= n; length++ {
		for i := 0; i <= n-length; i++ {
			j := i + length - 1
			dp[i][j] = 1 << 30
			for k := i; k < j; k++ {
				cost := dp[i][k] + dp[k+1][j] + dims[i]*dims[k+1]*dims[j+1]
				if cost < dp[i][j] {
					dp[i][j] = cost
				}
			}
		}
	}

	return dp[0][n-1]
}

func main() {
	dims := []int{40, 20, 30, 10, 30}
	fmt.Println(matrixChainOrder(dims))

	dims2 := []int{10, 20, 30}
	fmt.Println(matrixChainOrder(dims2))
}
