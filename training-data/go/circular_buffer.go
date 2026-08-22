package main

import "fmt"

type circularBuffer struct {
	buffer   []int
	capacity int
	head     int
	size     int
}

func newCircularBuffer(capacity int) *circularBuffer {
	return &circularBuffer{buffer: make([]int, capacity), capacity: capacity}
}

func (cb *circularBuffer) append(item int) {
	tail := (cb.head + cb.size) % cb.capacity
	cb.buffer[tail] = item
	if cb.size < cb.capacity {
		cb.size++
	} else {
		cb.head = (cb.head + 1) % cb.capacity
	}
}

func (cb *circularBuffer) toSlice() []int {
	result := make([]int, cb.size)
	for i := 0; i < cb.size; i++ {
		result[i] = cb.buffer[(cb.head+i)%cb.capacity]
	}
	return result
}

func main() {
	cb := newCircularBuffer(3)
	for i := 0; i < 5; i++ {
		cb.append(i)
	}
	fmt.Println(cb.toSlice())
}
