package main

import "fmt"

func ugly(n int) int {
	seq := []int{1}
	i2, i3, i5 := 0, 0, 0
	for len(seq) < n {
		c2, c3, c5 := seq[i2]*2, seq[i3]*3, seq[i5]*5
		next := min(c2, c3, c5)
		seq = append(seq, next)
		if next == c2 {
			i2++
		}
		if next == c3 {
			i3++
		}
		if next == c5 {
			i5++
		}
	}
	return seq[n-1]
}

func main() {
	for i := 1; i <= 12; i++ {
		fmt.Print(ugly(i), " ")
	}
	fmt.Println()
}
