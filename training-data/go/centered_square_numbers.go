// Centered square numbers 2n(n+1)+1
package main

import "fmt"

func term(n int) int { return ((2 * n) * (n + 1)) + 1 }

func main() {
	for n := 0; n < 10; n++ {
		fmt.Print(term(n), " ")
	}
	fmt.Println()
}
