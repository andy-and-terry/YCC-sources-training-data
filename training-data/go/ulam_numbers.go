package main

import "fmt"

func ulam(count int) []int {
	seq := []int{1, 2}
	in := map[int]bool{1: true, 2: true}
	for n := 3; len(seq) < count; n++ {
		ways := 0
		for _, a := range seq {
			if a < n-a && in[n-a] {
				ways++
			}
		}
		if ways == 1 {
			seq = append(seq, n)
			in[n] = true
		}
	}
	return seq
}

func main() {
	for _, v := range ulam(15) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
