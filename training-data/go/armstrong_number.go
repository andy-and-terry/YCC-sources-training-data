package main

import "fmt"

func isArmstrong(n uint64) bool {
	var digits []uint64
	for t := n; t > 0; t /= 10 {
		digits = append(digits, t%10)
	}
	var sum uint64
	for _, d := range digits {
		p := uint64(1)
		for range digits {
			p *= d
		}
		sum += p
	}
	return sum == n
}

func main() {
	for n := uint64(1); n < 10_000_000; n++ {
		if isArmstrong(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
