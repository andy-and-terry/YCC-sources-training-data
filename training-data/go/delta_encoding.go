package main

import "fmt"

func encode(xs []int) []int {
	d := make([]int, len(xs))
	d[0] = xs[0]
	for i := 1; i < len(xs); i++ {
		d[i] = xs[i] - xs[i-1]
	}
	return d
}

func decode(ds []int) []int {
	out := make([]int, len(ds))
	acc := 0
	for i, d := range ds {
		acc += d
		out[i] = acc
	}
	return out
}

func main() {
	d := encode([]int{10, 12, 15, 15, 20})
	fmt.Println(d, decode(d))
}
