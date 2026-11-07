package main

import "fmt"

func plusOne(digits []int) []int {
	out := append([]int(nil), digits...)
	for i := len(out) - 1; i >= 0; i-- {
		if out[i] < 9 {
			out[i]++
			return out
		}
		out[i] = 0
	}
	return append([]int{1}, out...)
}

func main() {
	fmt.Println(plusOne([]int{1, 2, 9})) // [1 3 0]
	fmt.Println(plusOne([]int{9, 9}))    // [1 0 0]
}
