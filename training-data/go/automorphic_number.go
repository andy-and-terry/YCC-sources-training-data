package main

import "fmt"

func isAutomorphic(n int) bool {
	mod := 1
	for m := n; m > 0; m /= 10 {
		mod *= 10
	}
	return n*n%mod == n
}

func main() {
	for n := 1; n < 1000; n++ {
		if isAutomorphic(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
