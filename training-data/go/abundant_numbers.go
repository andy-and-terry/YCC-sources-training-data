package main

import "fmt"

func divisorSum(n int) int {
	s := 0
	for d := 1; d < n; d++ {
		if n%d == 0 {
			s += d
		}
	}
	return s
}

func main() {
	for n := 1; n < 60; n++ {
		if divisorSum(n) > n {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
