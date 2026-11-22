package main

import "fmt"

// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
func main() {
	row := []int{1}
	fmt.Print(1, " ")
	for i := 0; i < 9; i++ {
		next := []int{0}
		for j := len(row) - 1; j >= 0; j-- {
			next = append(next, next[len(next)-1]+row[j])
		}
		row = next
		fmt.Print(row[len(row)-1], " ")
	}
	fmt.Println()
}
