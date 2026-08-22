package main

import "fmt"

type binaryHeap struct {
	items []int
}

func (h *binaryHeap) push(value int) {
	h.items = append(h.items, value)
	i := len(h.items) - 1
	for i > 0 {
		parent := (i - 1) / 2
		if h.items[parent] <= h.items[i] {
			break
		}
		h.items[parent], h.items[i] = h.items[i], h.items[parent]
		i = parent
	}
}

func (h *binaryHeap) pop() (int, bool) {
	if len(h.items) == 0 {
		return 0, false
	}
	top := h.items[0]
	last := len(h.items) - 1
	h.items[0] = h.items[last]
	h.items = h.items[:last]

	i := 0
	for {
		left, right := 2*i+1, 2*i+2
		smallest := i
		if left < len(h.items) && h.items[left] < h.items[smallest] {
			smallest = left
		}
		if right < len(h.items) && h.items[right] < h.items[smallest] {
			smallest = right
		}
		if smallest == i {
			break
		}
		h.items[i], h.items[smallest] = h.items[smallest], h.items[i]
		i = smallest
	}
	return top, true
}

func main() {
	h := &binaryHeap{}
	for _, v := range []int{5, 3, 8, 1, 9, 2} {
		h.push(v)
	}
	var sorted []int
	for {
		v, ok := h.pop()
		if !ok {
			break
		}
		sorted = append(sorted, v)
	}
	fmt.Println(sorted)
}
