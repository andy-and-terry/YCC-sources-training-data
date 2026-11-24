package main

import "fmt"

// Aliquot sequence: replace n by the sum of its proper divisors.
func aliquotSum(n int) int {
	s := 0
	for d := 1; d <= n/2; d++ {
		if n%d == 0 {
			s += d
		}
	}
	return s
}

func main() {
	seq := []int{12}
	for seq[len(seq)-1] > 1 && len(seq) < 20 {
		seq = append(seq, aliquotSum(seq[len(seq)-1]))
	}
	fmt.Println(seq)
}
