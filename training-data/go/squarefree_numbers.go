package main

import "fmt"

// Squarefree numbers up to 100; expect 61.
func squarefree(n int) bool {
	for d := 2; d*d <= n; d++ {
		if n%(d*d) == 0 {
			return false
		}
	}
	return true
}

func main() {
	c := 0
	for n := 1; n <= 100; n++ {
		if squarefree(n) {
			c++
		}
	}
	fmt.Println(c)
}
