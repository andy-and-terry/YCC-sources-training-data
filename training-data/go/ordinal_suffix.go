package main

import "fmt"

func ordinal(n int) string {
	if r := n % 100; r >= 11 && r <= 13 {
		return fmt.Sprintf("%dth", n)
	}
	switch n % 10 {
	case 1:
		return fmt.Sprintf("%dst", n)
	case 2:
		return fmt.Sprintf("%dnd", n)
	case 3:
		return fmt.Sprintf("%drd", n)
	}
	return fmt.Sprintf("%dth", n)
}

func main() {
	for _, n := range []int{1, 2, 3, 4, 11, 12, 13, 21, 101, 111} {
		fmt.Print(ordinal(n), " ")
	}
	fmt.Println()
}
