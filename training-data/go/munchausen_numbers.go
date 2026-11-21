package main

import "fmt"

// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
func isMunchausen(n int) bool {
	sum := 0
	for m := n; m > 0; m /= 10 {
		d := m % 10
		p := 1
		for i := 0; i < d; i++ {
			p *= d
		}
		if d == 0 {
			p = 0
		}
		sum += p
	}
	return sum == n
}

func main() {
	for n := 1; n < 5000; n++ {
		if isMunchausen(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
