package main

import "fmt"

func triangular(n int) []int {
	out := make([]int, 0, n)
	sum := 0
	for i := 1; i <= n; i++ {
		sum += i
		out = append(out, sum)
	}
	return out
}

func main() {
	fmt.Println(triangular(10))
}
