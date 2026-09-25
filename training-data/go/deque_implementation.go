package main

import (
	"errors"
	"fmt"
)

var errEmpty = errors.New("deque is empty")

type Deque[T any] struct {
	buf        []T
	head, size int
}

func (d *Deque[T]) grow() {
	if d.size < len(d.buf) {
		return
	}
	nb := make([]T, max(4, 2*len(d.buf)))
	for i := 0; i < d.size; i++ {
		nb[i] = d.buf[(d.head+i)%len(d.buf)]
	}
	d.buf, d.head = nb, 0
}

func (d *Deque[T]) PushBack(x T) {
	d.grow()
	d.buf[(d.head+d.size)%len(d.buf)] = x
	d.size++
}

func (d *Deque[T]) PushFront(x T) {
	d.grow()
	d.head = (d.head - 1 + len(d.buf)) % len(d.buf)
	d.buf[d.head] = x
	d.size++
}

func (d *Deque[T]) PopFront() (T, error) {
	var zero T
	if d.size == 0 {
		return zero, errEmpty
	}
	x := d.buf[d.head]
	d.buf[d.head] = zero
	d.head = (d.head + 1) % len(d.buf)
	d.size--
	return x, nil
}

func (d *Deque[T]) PopBack() (T, error) {
	var zero T
	if d.size == 0 {
		return zero, errEmpty
	}
	d.size--
	i := (d.head + d.size) % len(d.buf)
	x := d.buf[i]
	d.buf[i] = zero
	return x, nil
}

func (d *Deque[T]) Len() int { return d.size }

func main() {
	var d Deque[string]
	for _, s := range []string{"c", "d", "e"} {
		d.PushBack(s)
	}
	d.PushFront("b")
	d.PushFront("a")
	f, _ := d.PopFront()
	b, _ := d.PopBack()
	fmt.Println(f, b, d.Len())
	var empty Deque[int]
	_, err := empty.PopBack()
	fmt.Println(err)
}
