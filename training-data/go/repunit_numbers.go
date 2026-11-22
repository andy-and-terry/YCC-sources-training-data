package main

import "fmt"

// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
func main() {
	r := 0
	for i := 0; i < 8; i++ {
		r = r*10 + 1
		fmt.Print(r, " ")
	}
	fmt.Println()
}
