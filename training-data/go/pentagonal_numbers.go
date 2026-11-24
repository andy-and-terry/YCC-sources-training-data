package main

import "fmt"

// Pentagonal numbers: n(3n-1)/2.
func main() {
	for n := 1; n <= 10; n++ {
		fmt.Print(n*(3*n-1)/2, " ")
	}
	fmt.Println()
}
