package main

import (
	"cmp"
	"fmt"
)

type entry[T cmp.Ordered] struct{ value, min T }

type MinStack[T cmp.Ordered] struct{ items []entry[T] }

func (s *MinStack[T]) Push(v T) {
	m := v
	if n := len(s.items); n > 0 && s.items[n-1].min < v {
		m = s.items[n-1].min
	}
	s.items = append(s.items, entry[T]{v, m})
}

func (s *MinStack[T]) Pop() T {
	n := len(s.items) - 1
	v := s.items[n].value
	s.items = s.items[:n]
	return v
}

func (s *MinStack[T]) Min() T { return s.items[len(s.items)-1].min }

func main() {
	var s MinStack[int]
	for _, v := range []int{5, 3, 7, 2} {
		s.Push(v)
	}
	fmt.Println(s.Min())
	s.Pop()
	fmt.Println(s.Min())
}
