package main

import (
	"container/heap"
	"fmt"
)

type pqItem struct {
	value    string
	priority int
}

type priorityQueue []*pqItem

func (pq priorityQueue) Len() int            { return len(pq) }
func (pq priorityQueue) Less(i, j int) bool  { return pq[i].priority < pq[j].priority }
func (pq priorityQueue) Swap(i, j int)       { pq[i], pq[j] = pq[j], pq[i] }
func (pq *priorityQueue) Push(x interface{}) { *pq = append(*pq, x.(*pqItem)) }
func (pq *priorityQueue) Pop() interface{} {
	old := *pq
	n := len(old)
	item := old[n-1]
	*pq = old[:n-1]
	return item
}

func main() {
	pq := &priorityQueue{}
	heap.Init(pq)
	heap.Push(pq, &pqItem{"low", 5})
	heap.Push(pq, &pqItem{"high", 1})
	heap.Push(pq, &pqItem{"medium", 3})
	for pq.Len() > 0 {
		fmt.Println(heap.Pop(pq).(*pqItem).value)
	}
}
