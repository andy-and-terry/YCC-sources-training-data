package main

import "fmt"

func Map[T, U any](xs []T, f func(T) U) []U {
	out := make([]U, 0, len(xs))
	for _, x := range xs {
		out = append(out, f(x))
	}
	return out
}

func Filter[T any](xs []T, pred func(T) bool) []T {
	var out []T
	for _, x := range xs {
		if pred(x) {
			out = append(out, x)
		}
	}
	return out
}

func main() {
	nums := []int{1, 2, 3, 4, 5}
	sq := Map(nums, func(n int) int { return n * n })
	fmt.Println(Filter(sq, func(n int) bool { return n > 4 }))
}
