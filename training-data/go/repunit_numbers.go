// Repunits: numbers made only of the digit 1.
package main

import "fmt"

func main() {
	r := 0
	for i := 0; i < 5; i++ {
		r = r*10 + 1
		fmt.Print(r, " ")
	}
	fmt.Println()
}
