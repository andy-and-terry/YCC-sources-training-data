package main

import "fmt"

func sigma(n int) int {
	s := 0
	for d := 1; d <= n; d++ {
		if n%d == 0 {
			s += d
		}
	}
	return s
}

func main() {
	for n := 1; n < 100; n++ {
		if sigma(sigma(n)) == 2*n {
			fmt.Print(n, " ")
		}
	}
	fmt.Println() // 2 4 16 64
}
