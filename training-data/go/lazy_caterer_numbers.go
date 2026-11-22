package main

import "fmt"

// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
func main() {
	for n := 0; n < 10; n++ {
		fmt.Print(n*(n+1)/2+1, " ")
	}
	fmt.Println()
}
