package main

import "fmt"

func isHarshad(n int) bool {
	s := 0
	for m := n; m > 0; m /= 10 {
		s += m % 10
	}
	return n > 0 && n%s == 0
}

func main() {
	for n := 1; n < 50; n++ {
		if isHarshad(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
