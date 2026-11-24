package main

import "fmt"

// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
func main() {
	r := 0
	for n := 1; n <= 8; n++ {
		r = r*10 + 1
		note := ""
		if r%3 == 0 {
			note = "  (divisible by 3)"
		}
		fmt.Println(r, note)
	}
}
