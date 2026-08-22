package main

import "fmt"

type disjointSet struct {
	parent map[string]string
	size   map[string]int
}

func newDisjointSet(elements []string) *disjointSet {
	ds := &disjointSet{parent: make(map[string]string), size: make(map[string]int)}
	for _, e := range elements {
		ds.parent[e] = e
		ds.size[e] = 1
	}
	return ds
}

func (ds *disjointSet) find(x string) string {
	for ds.parent[x] != x {
		ds.parent[x] = ds.parent[ds.parent[x]]
		x = ds.parent[x]
	}
	return x
}

func (ds *disjointSet) union(a, b string) {
	rootA, rootB := ds.find(a), ds.find(b)
	if rootA == rootB {
		return
	}
	if ds.size[rootA] < ds.size[rootB] {
		rootA, rootB = rootB, rootA
	}
	ds.parent[rootB] = rootA
	ds.size[rootA] += ds.size[rootB]
}

func (ds *disjointSet) connected(a, b string) bool {
	return ds.find(a) == ds.find(b)
}

func main() {
	ds := newDisjointSet([]string{"a", "b", "c", "d"})
	ds.union("a", "b")
	ds.union("b", "c")
	fmt.Println(ds.connected("a", "c"), ds.connected("a", "d"))
}
