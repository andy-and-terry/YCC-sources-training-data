package main

import "fmt"

func recaman(count int) []int {
	seq := []int{0}
	seen := map[int]bool{0: true}
	for n := 1; n < count; n++ {
		next := seq[n-1] - n
		if next < 0 || seen[next] {
			next = seq[n-1] + n
		}
		seq = append(seq, next)
		seen[next] = true
	}
	return seq
}

func main() {
	for _, v := range recaman(20) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
