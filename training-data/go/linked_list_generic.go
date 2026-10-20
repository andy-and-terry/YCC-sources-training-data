package main

import "fmt"

type node[T any] struct {
	val  T
	next *node[T]
}

type List[T any] struct{ head *node[T] }

func (l *List[T]) Prepend(v T) { l.head = &node[T]{v, l.head} }
func (l *List[T]) Each(f func(T)) {
	for n := l.head; n != nil; n = n.next {
		f(n.val)
	}
}

func main() {
	var l List[int]
	for i := 0; i < 3; i++ {
		l.Prepend(i)
	}
	l.Each(func(v int) { fmt.Print(v, " ") })
	fmt.Println()
}
