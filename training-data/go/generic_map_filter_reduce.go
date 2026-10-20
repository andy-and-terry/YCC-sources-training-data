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

func Reduce[T, A any](xs []T, init A, f func(A, T) A) A {
	acc := init
	for _, x := range xs {
		acc = f(acc, x)
	}
	return acc
}

func main() {
	nums := []int{1, 2, 3, 4, 5, 6}
	evens := Filter(nums, func(n int) bool { return n%2 == 0 })
	squares := Map(evens, func(n int) int { return n * n })
	sum := Reduce(squares, 0, func(a, n int) int { return a + n })
	fmt.Println(evens, squares, sum)
}
