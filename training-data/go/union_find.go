package main

import "fmt"

type unionFind struct {
	parent, rank []int
}

func newUnionFind(size int) *unionFind {
	uf := &unionFind{parent: make([]int, size), rank: make([]int, size)}
	for i := range uf.parent {
		uf.parent[i] = i
	}
	return uf
}

func (uf *unionFind) find(x int) int {
	if uf.parent[x] != x {
		uf.parent[x] = uf.find(uf.parent[x])
	}
	return uf.parent[x]
}

func (uf *unionFind) union(a, b int) bool {
	rootA, rootB := uf.find(a), uf.find(b)
	if rootA == rootB {
		return false
	}
	if uf.rank[rootA] < uf.rank[rootB] {
		rootA, rootB = rootB, rootA
	}
	uf.parent[rootB] = rootA
	if uf.rank[rootA] == uf.rank[rootB] {
		uf.rank[rootA]++
	}
	return true
}

func main() {
	uf := newUnionFind(5)
	uf.union(0, 1)
	uf.union(1, 2)
	fmt.Println(uf.find(0) == uf.find(2), uf.find(0) == uf.find(3))
}
