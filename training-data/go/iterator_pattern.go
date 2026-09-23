package main

import "fmt"

type Iterator[T any] interface {
	HasNext() bool
	Next() T
}

type sliceIterator[T any] struct {
	items []T
	pos   int
}

func (it *sliceIterator[T]) HasNext() bool {
	return it.pos < len(it.items)
}

func (it *sliceIterator[T]) Next() T {
	value := it.items[it.pos]
	it.pos++
	return value
}

type Collection[T any] struct {
	items []T
}

func (c *Collection[T]) Add(item T) {
	c.items = append(c.items, item)
}

func (c *Collection[T]) Iterator() Iterator[T] {
	return &sliceIterator[T]{items: c.items}
}

func main() {
	numbers := &Collection[int]{}
	numbers.Add(10)
	numbers.Add(20)
	numbers.Add(30)

	it := numbers.Iterator()
	for it.HasNext() {
		fmt.Println(it.Next())
	}

	names := &Collection[string]{}
	names.Add("alpha")
	names.Add("beta")

	nameIt := names.Iterator()
	var joined string
	for nameIt.HasNext() {
		joined += nameIt.Next() + " "
	}
	fmt.Println(joined)
}
