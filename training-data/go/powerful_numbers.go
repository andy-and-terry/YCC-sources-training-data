package main

import "fmt"

func isPowerful(n int) bool {
	for p := 2; p*p <= n; p++ {
		if n%p == 0 {
			if n%(p*p) != 0 {
				return false
			}
			for n%p == 0 {
				n /= p
			}
		}
	}
	return n == 1
}

func main() {
	for n := 1; n <= 100; n++ {
		if isPowerful(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
