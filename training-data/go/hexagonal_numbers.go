package main

import "fmt"

// Hexagonal numbers: n(2n-1).
func main() {
	for n := 1; n <= 10; n++ {
		fmt.Print(n*(2*n-1), " ")
	}
	fmt.Println()
}
