package main

import "fmt"

type Number interface{ ~int | ~float64 }

type Stack[T any] struct{ items []T }

func (s *Stack[T]) Push(v T) { s.items = append(s.items, v) }
func (s *Stack[T]) Pop() (T, bool) {
	var zero T
	if len(s.items) == 0 {
		return zero, false
	}
	v := s.items[len(s.items)-1]
	s.items = s.items[:len(s.items)-1]
	return v, true
}

func Sum[T Number](xs []T) (t T) {
	for _, x := range xs {
		t += x
	}
	return
}

func main() {
	s := &Stack[int]{}
	s.Push(1)
	s.Push(2)
	fmt.Println(s.Pop())
	fmt.Println(Sum([]float64{1.5, 2.5}))
}
