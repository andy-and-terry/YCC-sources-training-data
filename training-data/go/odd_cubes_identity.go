package main

import "fmt"

func cubeFromOdds(n int) int {
	start := n*n - n + 1
	sum := 0
	for i := 0; i < n; i++ {
		sum += start + 2*i
	}
	return sum
}

func main() {
	for n := 1; n <= 5; n++ {
		fmt.Println(n, cubeFromOdds(n), cubeFromOdds(n) == n*n*n)
	}
}
