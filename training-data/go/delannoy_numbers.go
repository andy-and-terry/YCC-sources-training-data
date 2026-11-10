package main

import "fmt"

func centralDelannoy(n int) int {
	g := make([][]int, n+1)
	for i := range g {
		g[i] = make([]int, n+1)
		for j := range g[i] {
			if i == 0 || j == 0 {
				g[i][j] = 1
			} else {
				g[i][j] = g[i-1][j] + g[i][j-1] + g[i-1][j-1]
			}
		}
	}
	return g[n][n]
}

func main() {
	for n := 0; n <= 5; n++ {
		fmt.Print(centralDelannoy(n), " ")
	}
	fmt.Println() // 1 3 13 63 321 1683
}
