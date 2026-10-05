package main

import "fmt"

func grayCode(n int) []int {
	out := make([]int, 1<<n)
	for i := range out {
		out[i] = i ^ (i >> 1)
	}
	return out
}

func main() {
	for _, g := range grayCode(3) {
		fmt.Printf("%03b\n", g)
	}
}
