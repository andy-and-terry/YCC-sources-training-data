package main

import "fmt"

type Set[T comparable] map[T]struct{}

func (s Set[T]) Add(v T) { s[v] = struct{}{} }

func Intersect[T comparable](a, b Set[T]) Set[T] {
	out := Set[T]{}
	for k := range a {
		if _, ok := b[k]; ok {
			out.Add(k)
		}
	}
	return out
}

func main() {
	a, b := Set[int]{}, Set[int]{}
	for _, v := range []int{1, 2, 3} {
		a.Add(v)
	}
	for _, v := range []int{2, 3, 4} {
		b.Add(v)
	}
	fmt.Println(len(Intersect(a, b)))
}
