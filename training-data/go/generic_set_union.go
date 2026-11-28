package main

import "fmt"

type Set[T comparable] map[T]struct{}

func (s Set[T]) Add(v T) { s[v] = struct{}{} }

func Union[T comparable](a, b Set[T]) Set[T] {
	out := Set[T]{}
	for k := range a {
		out.Add(k)
	}
	for k := range b {
		out.Add(k)
	}
	return out
}

func main() {
	a, b := Set[int]{}, Set[int]{}
	a.Add(1)
	b.Add(2)
	b.Add(1)
	fmt.Println(len(Union(a, b)))
}
