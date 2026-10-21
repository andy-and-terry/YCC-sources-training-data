package main

import "fmt"

func derangements(n int) int {
	a, b := 1, 0
	if n == 0 {
		return a
	}
	for i := 2; i <= n; i++ {
		a, b = b, (i-1)*(a+b)
	}
	return b
}

func main() {
	for i := 0; i < 8; i++ {
		fmt.Print(derangements(i), " ")
	}
	fmt.Println()
}
