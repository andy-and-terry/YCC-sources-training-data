package main

import "fmt"

func stirling2(n, k int) int {
	t := make([][]int, n+1)
	for i := range t {
		t[i] = make([]int, k+1)
	}
	t[0][0] = 1
	for i := 1; i <= n; i++ {
		for j := 1; j <= k && j <= i; j++ {
			t[i][j] = j*t[i-1][j] + t[i-1][j-1]
		}
	}
	return t[n][k]
}

func main() {
	fmt.Println(stirling2(5, 2), stirling2(6, 3))
}
