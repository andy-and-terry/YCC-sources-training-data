package main

import (
	"fmt"
	"sort"
)

type kruskalEdge struct {
	u, v, w int
}

type kruskalUF struct {
	parent []int
}

func newKruskalUF(size int) *kruskalUF {
	uf := &kruskalUF{parent: make([]int, size)}
	for i := range uf.parent {
		uf.parent[i] = i
	}
	return uf
}

func (uf *kruskalUF) find(x int) int {
	for uf.parent[x] != x {
		x = uf.parent[x]
	}
	return x
}

func (uf *kruskalUF) union(a, b int) bool {
	rootA, rootB := uf.find(a), uf.find(b)
	if rootA == rootB {
		return false
	}
	uf.parent[rootA] = rootB
	return true
}

func kruskal(numNodes int, edges []kruskalEdge) []kruskalEdge {
	sorted := append([]kruskalEdge(nil), edges...)
	sort.Slice(sorted, func(i, j int) bool { return sorted[i].w < sorted[j].w })
	uf := newKruskalUF(numNodes)
	var mst []kruskalEdge
	for _, e := range sorted {
		if uf.union(e.u, e.v) {
			mst = append(mst, e)
		}
	}
	return mst
}

func main() {
	edges := []kruskalEdge{{0, 1, 1}, {0, 2, 3}, {1, 2, 4}, {1, 3, 2}, {2, 3, 5}}
	fmt.Println(kruskal(4, edges))
}
