package main

import "fmt"

type Number interface{ ~int | ~float64 }

func Map[T, U any](xs []T, f func(T) U) []U {
	out := make([]U, 0, len(xs))
	for _, x := range xs {
		out = append(out, f(x))
	}
	return out
}

func Sum[T Number](xs []T) T {
	var s T
	for _, x := range xs {
		s += x
	}
	return s
}

func main() {
	sq := Map([]int{1, 2, 3}, func(x int) int { return x * x })
	fmt.Println(sq, Sum(sq))
}
