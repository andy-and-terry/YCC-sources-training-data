package main

import "fmt"

type tarjanGraph struct {
	adj     map[int][]int
	index   map[int]int
	low     map[int]int
	onStack map[int]bool
	stack   []int
	counter int
	sccs    [][]int
}

func newTarjanGraph() *tarjanGraph {
	return &tarjanGraph{
		adj:     make(map[int][]int),
		index:   make(map[int]int),
		low:     make(map[int]int),
		onStack: make(map[int]bool),
	}
}

func (g *tarjanGraph) addEdge(u, v int) {
	g.adj[u] = append(g.adj[u], v)
}

func (g *tarjanGraph) strongConnect(v int) {
	g.index[v] = g.counter
	g.low[v] = g.counter
	g.counter++
	g.stack = append(g.stack, v)
	g.onStack[v] = true

	for _, w := range g.adj[v] {
		if _, seen := g.index[w]; !seen {
			g.strongConnect(w)
			if g.low[w] < g.low[v] {
				g.low[v] = g.low[w]
			}
		} else if g.onStack[w] {
			if g.index[w] < g.low[v] {
				g.low[v] = g.index[w]
			}
		}
	}

	if g.low[v] == g.index[v] {
		var component []int
		for {
			n := len(g.stack) - 1
			w := g.stack[n]
			g.stack = g.stack[:n]
			g.onStack[w] = false
			component = append(component, w)
			if w == v {
				break
			}
		}
		g.sccs = append(g.sccs, component)
	}
}

func (g *tarjanGraph) run(numNodes int) [][]int {
	for v := 0; v < numNodes; v++ {
		if _, seen := g.index[v]; !seen {
			g.strongConnect(v)
		}
	}
	return g.sccs
}

func main() {
	g := newTarjanGraph()
	g.addEdge(0, 1)
	g.addEdge(1, 2)
	g.addEdge(2, 0)
	g.addEdge(1, 3)
	g.addEdge(3, 4)
	fmt.Println(g.run(5))
}
