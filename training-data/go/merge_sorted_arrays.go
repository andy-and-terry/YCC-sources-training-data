package main

import (
	"container/heap"
	"fmt"
)

type item struct{ val, list, idx int }
type minHeap []item

func (h minHeap) Len() int           { return len(h) }
func (h minHeap) Less(i, j int) bool { return h[i].val < h[j].val }
func (h minHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }
func (h *minHeap) Push(x any)        { *h = append(*h, x.(item)) }
func (h *minHeap) Pop() any {
	old := *h
	x := old[len(old)-1]
	*h = old[:len(old)-1]
	return x
}

func mergeK(lists [][]int) []int {
	h := &minHeap{}
	for i, l := range lists {
		if len(l) > 0 {
			*h = append(*h, item{l[0], i, 0})
		}
	}
	heap.Init(h)
	var out []int
	for h.Len() > 0 {
		it := heap.Pop(h).(item)
		out = append(out, it.val)
		if it.idx+1 < len(lists[it.list]) {
			heap.Push(h, item{lists[it.list][it.idx+1], it.list, it.idx + 1})
		}
	}
	return out
}

func main() {
	fmt.Println(mergeK([][]int{{1, 4, 7}, {2, 3, 8, 9}}))
	fmt.Println(mergeK([][]int{{1, 5, 9}, {2, 6}, {}, {0, 3, 4, 10}}))
}
