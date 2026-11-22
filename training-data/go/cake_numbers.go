package main

import "fmt"

// Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
func main() {
	for n := 0; n < 10; n++ {
		fmt.Print((n*n*n+5*n+6)/6, " ")
	}
	fmt.Println()
}
