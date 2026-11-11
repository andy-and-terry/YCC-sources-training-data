// Pronic numbers n(n+1)
package main

import "fmt"

func term(n int) int { return n * (n + 1) }

func main() {
	for n := 0; n < 10; n++ {
		fmt.Print(term(n), " ")
	}
	fmt.Println()
}
