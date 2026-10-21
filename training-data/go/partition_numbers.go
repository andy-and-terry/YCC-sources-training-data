package main

import "fmt"

func partitions(n int) int {
	ways := make([]int, n+1)
	ways[0] = 1
	for part := 1; part <= n; part++ {
		for t := part; t <= n; t++ {
			ways[t] += ways[t-part]
		}
	}
	return ways[n]
}

func main() {
	for i := 0; i < 10; i++ {
		fmt.Print(partitions(i), " ")
	}
	fmt.Println()
}
