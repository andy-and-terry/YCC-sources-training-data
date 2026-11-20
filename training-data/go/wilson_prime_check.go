package main

import "fmt"

// Wilson's theorem: n is prime iff (n-1)! mod n == n-1.
func wilson(n int) bool {
	if n < 2 {
		return false
	}
	f := 1
	for i := 2; i < n; i++ {
		f = f * i % n
	}
	return f == n-1
}

func main() {
	for n := 2; n < 20; n++ {
		if wilson(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
