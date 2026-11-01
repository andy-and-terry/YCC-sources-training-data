package main

import "fmt"

// Sum of prime factors counted with multiplicity.
func sopfr(n int) int {
	total := 0
	for p := 2; p*p <= n; p++ {
		for n%p == 0 {
			total += p
			n /= p
		}
	}
	if n > 1 {
		total += n
	}
	return total
}

func main() {
	for n := 2; n < 110; n++ {
		if sopfr(n) == sopfr(n+1) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
