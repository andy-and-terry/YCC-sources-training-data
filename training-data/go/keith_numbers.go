package main

import (
	"fmt"
	"strconv"
)

// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
func isKeith(n int) bool {
	var seq []int
	for _, c := range strconv.Itoa(n) {
		seq = append(seq, int(c-'0'))
	}
	k := len(seq)
	for seq[len(seq)-1] < n {
		sum := 0
		for _, v := range seq[len(seq)-k:] {
			sum += v
		}
		seq = append(seq, sum)
	}
	return seq[len(seq)-1] == n
}

func main() {
	for n := 10; n < 1200; n++ {
		if isKeith(n) {
			fmt.Print(n, " ")
		}
	}
	fmt.Println()
}
