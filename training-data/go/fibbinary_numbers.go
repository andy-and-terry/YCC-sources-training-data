package main

import "fmt"

// Fibbinary numbers: no two adjacent 1 bits.
func main() {
	for n := 0; n < 50; n++ {
		if n&(n>>1) == 0 {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
