package main

import "fmt"

type Number interface {
	~int | ~int64 | ~float64
}

func Sum[T Number](xs []T) T {
	var total T
	for _, x := range xs {
		total += x
	}
	return total
}

func MapSlice[T, U any](xs []T, f func(T) U) []U {
	out := make([]U, 0, len(xs))
	for _, x := range xs {
		out = append(out, f(x))
	}
	return out
}

func main() {
	fmt.Println(Sum([]int{1, 2, 3}), Sum([]float64{1.5, 2.5}))
	fmt.Println(MapSlice([]int{1, 2, 3}, func(n int) string { return fmt.Sprint(n * 2) }))
}
