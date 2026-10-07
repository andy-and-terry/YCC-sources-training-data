package main

import "fmt"

type listNode[T any] struct {
	value T
	next  *listNode[T]
}

type LinkedList[T any] struct {
	head, tail *listNode[T]
	length     int
}

func (l *LinkedList[T]) PushBack(value T) {
	node := &listNode[T]{value: value}
	if l.tail == nil {
		l.head = node
	} else {
		l.tail.next = node
	}
	l.tail = node
	l.length++
}

func (l *LinkedList[T]) PopFront() (T, bool) {
	var zero T
	if l.head == nil {
		return zero, false
	}
	value := l.head.value
	l.head = l.head.next
	if l.head == nil {
		l.tail = nil
	}
	l.length--
	return value, true
}

func (l *LinkedList[T]) ForEach(fn func(T)) {
	for node := l.head; node != nil; node = node.next {
		fn(node.value)
	}
}

func (l *LinkedList[T]) Len() int {
	return l.length
}

func main() {
	var ints LinkedList[int]
	for _, v := range []int{10, 20, 30} {
		ints.PushBack(v)
	}
	ints.ForEach(func(v int) { fmt.Print(v, " ") })
	fmt.Println()

	front, ok := ints.PopFront()
	fmt.Println(front, ok, ints.Len())

	var words LinkedList[string]
	words.PushBack("go")
	words.PushBack("lang")
	words.ForEach(func(v string) { fmt.Print(v, " ") })
	fmt.Println()
}
