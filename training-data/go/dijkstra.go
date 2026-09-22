package main

import (
	"container/heap"
	"fmt"
)

type dijkstraEdge struct {
	to, weight int
}

type dijkstraItem struct {
	node, dist int
}

type dijkstraPQ []dijkstraItem

func (pq dijkstraPQ) Len() int            { return len(pq) }
func (pq dijkstraPQ) Less(i, j int) bool  { return pq[i].dist < pq[j].dist }
func (pq dijkstraPQ) Swap(i, j int)       { pq[i], pq[j] = pq[j], pq[i] }
func (pq *dijkstraPQ) Push(x interface{}) { *pq = append(*pq, x.(dijkstraItem)) }
func (pq *dijkstraPQ) Pop() interface{} {
	old := *pq
	n := len(old)
	item := old[n-1]
	*pq = old[:n-1]
	return item
}

func dijkstra(graph map[int][]dijkstraEdge, numNodes, source int) []int {
	const inf = 1 << 30
	dist := make([]int, numNodes)
	for i := range dist {
		dist[i] = inf
	}
	dist[source] = 0

	pq := &dijkstraPQ{{node: source, dist: 0}}
	heap.Init(pq)
	for pq.Len() > 0 {
		cur := heap.Pop(pq).(dijkstraItem)
		if cur.dist > dist[cur.node] {
			continue
		}
		for _, e := range graph[cur.node] {
			next := cur.dist + e.weight
			if next < dist[e.to] {
				dist[e.to] = next
				heap.Push(pq, dijkstraItem{node: e.to, dist: next})
			}
		}
	}
	return dist
}

func main() {
	graph := map[int][]dijkstraEdge{
		0: {{1, 4}, {2, 1}},
		1: {{3, 1}},
		2: {{1, 2}, {3, 5}},
		3: {},
	}
	fmt.Println(dijkstra(graph, 4, 0))
}
