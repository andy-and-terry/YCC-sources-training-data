package main

import "fmt"

func isSphenic(n int) bool {
	distinct := 0
	for p := 2; p*p <= n; p++ {
		if n%p == 0 {
			n /= p
			if n%p == 0 {
				return false
			}
			distinct++
		}
	}
	if n > 1 {
		distinct++
	}
	return distinct == 3
}

func main() {
	for n := 2; n < 80; n++ {
		if isSphenic(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
