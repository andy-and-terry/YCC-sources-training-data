package main

import "fmt"

func properDivisorSum(n int) int {
	total := 0
	for d := 1; d < n; d++ {
		if n%d == 0 {
			total += d
		}
	}
	return total
}

func aliquot(start int) []int {
	seq := []int{start}
	for seq[len(seq)-1] != 0 {
		seq = append(seq, properDivisorSum(seq[len(seq)-1]))
	}
	return seq
}

func main() {
	for _, v := range aliquot(12) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
