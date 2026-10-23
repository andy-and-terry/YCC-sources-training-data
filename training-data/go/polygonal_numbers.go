package main

import "fmt"

// polygonal returns the n-th s-gonal number.
func polygonal(s, n int) int {
	return ((s-2)*n*n - (s-4)*n) / 2
}

func main() {
	names := []string{"triangular", "pentagonal", "hexagonal"}
	sides := []int{3, 5, 6}
	for i, name := range names {
		fmt.Print(name + ":")
		for n := 1; n <= 10; n++ {
			fmt.Print(" ", polygonal(sides[i], n))
		}
		fmt.Println()
	}
}
