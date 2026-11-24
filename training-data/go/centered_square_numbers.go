package main

import "fmt"

// Centered square numbers: n^2 + (n+1)^2.
func main() {
	for n := 0; n < 10; n++ {
		fmt.Print(n*n+(n+1)*(n+1), " ")
	}
	fmt.Println()
}
