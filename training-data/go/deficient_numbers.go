package main

import "fmt"

func sigma(n int) int {
	s := 0
	for d := 1; d*d <= n; d++ {
		if n%d == 0 {
			s += d
			if d*d != n {
				s += n / d
			}
		}
	}
	return s
}

func main() {
	for n := 1; n <= 20; n++ {
		if sigma(n) < 2*n {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
