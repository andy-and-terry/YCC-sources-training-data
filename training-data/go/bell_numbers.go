package main

import "fmt"

func bell(n int) int {
	row := []int{1}
	for i := 0; i < n; i++ {
		next := []int{row[len(row)-1]}
		for _, x := range row {
			next = append(next, next[len(next)-1]+x)
		}
		row = next
	}
	return row[0]
}

func main() {
	for i := 0; i < 10; i++ {
		fmt.Print(bell(i), " ")
	}
	fmt.Println()
}
