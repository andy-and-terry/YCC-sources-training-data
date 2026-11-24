package main

import "fmt"

// Tetrahedral numbers: n(n+1)(n+2)/6.
func main() {
	for n := 1; n <= 10; n++ {
		fmt.Print(n*(n+1)*(n+2)/6, " ")
	}
	fmt.Println()
}
