package main

import "fmt"

func isPronic(n int) bool {
	for k := 0; k*(k+1) <= n; k++ {
		if k*(k+1) == n {
			return true
		}
	}
	return false
}

func main() {
	for n := 0; n < 100; n++ {
		if isPronic(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
