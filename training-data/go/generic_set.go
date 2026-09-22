package main

import "fmt"

type Set[T comparable] struct {
	items map[T]struct{}
}

func NewSet[T comparable](values ...T) *Set[T] {
	s := &Set[T]{items: make(map[T]struct{})}
	for _, v := range values {
		s.items[v] = struct{}{}
	}
	return s
}

func (s *Set[T]) Add(value T) {
	s.items[value] = struct{}{}
}

func (s *Set[T]) Contains(value T) bool {
	_, ok := s.items[value]
	return ok
}

func (s *Set[T]) Len() int {
	return len(s.items)
}

func (s *Set[T]) Union(other *Set[T]) *Set[T] {
	result := NewSet[T]()
	for v := range s.items {
		result.Add(v)
	}
	for v := range other.items {
		result.Add(v)
	}
	return result
}

func main() {
	a := NewSet(1, 2, 3)
	b := NewSet(3, 4, 5)

	fmt.Println(a.Contains(2), a.Contains(9))

	union := a.Union(b)
	fmt.Println(union.Len())

	names := NewSet("go", "rust")
	names.Add("go")
	fmt.Println(names.Len())
}
