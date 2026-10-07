package main

import "fmt"

type kind int

const (
	deficient kind = iota
	perfect
	abundant
)

func (k kind) String() string { return [...]string{"deficient", "perfect", "abundant"}[k] }

func divisorSums(limit int) []int {
	s := make([]int, limit+1)
	for d := 1; d <= limit/2; d++ {
		for m := 2 * d; m <= limit; m += d {
			s[m] += d
		}
	}
	return s
}

func main() {
	const limit = 100000
	s := divisorSums(limit)
	counts := map[kind]int{}
	for n := 2; n <= limit; n++ {
		k := deficient
		if s[n] == n {
			k = perfect
			fmt.Println("perfect:", n)
		} else if s[n] > n {
			k = abundant
		}
		counts[k]++
	}
	fmt.Println(counts)
}
