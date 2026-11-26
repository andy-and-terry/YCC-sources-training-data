package main

import "fmt"

// Deficient numbers below 100; expect 76.
func properSum(n int) int {
	t := 0
	for d := 1; d < n; d++ {
		if n%d == 0 {
			t += d
		}
	}
	return t
}

func main() {
	c := 0
	for n := 1; n < 100; n++ {
		if properSum(n) < n {
			c++
		}
	}
	fmt.Println(c)
}
