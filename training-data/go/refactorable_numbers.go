package main

import "fmt"

func tau(n int) int {
	c := 0
	for d := 1; d <= n; d++ {
		if n%d == 0 {
			c++
		}
	}
	return c
}

func main() {
	for n := 1; n < 60; n++ {
		if n%tau(n) == 0 {
			fmt.Print(n, " ")
		}
	}
	fmt.Println() // 1 2 8 9 12 18 24 36 40 56
}
