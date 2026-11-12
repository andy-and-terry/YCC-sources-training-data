package main

import "fmt"

func Map[T, U any](xs []T, f func(T) U) []U {
	out := make([]U, 0, len(xs))
	for _, x := range xs {
		out = append(out, f(x))
	}
	return out
}

func Filter[T any](xs []T, p func(T) bool) []T {
	var out []T
	for _, x := range xs {
		if p(x) {
			out = append(out, x)
		}
	}
	return out
}

func main() {
	sq := Map([]int{1, 2, 3, 4}, func(n int) int { return n * n })
	fmt.Println(Filter(sq, func(n int) bool { return n > 4 }))
}
