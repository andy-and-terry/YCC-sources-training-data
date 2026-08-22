package main

import "fmt"

type Graph struct {
	adjacency map[string][]string
}

func NewGraph() *Graph {
	return &Graph{adjacency: make(map[string][]string)}
}

func (g *Graph) AddEdge(u, v string, directed bool) {
	g.adjacency[u] = append(g.adjacency[u], v)
	if !directed {
		g.adjacency[v] = append(g.adjacency[v], u)
	}
}

func (g *Graph) BFS(start string) []string {
	visited := map[string]bool{start: true}
	queue := []string{start}
	var order []string

	for len(queue) > 0 {
		node := queue[0]
		queue = queue[1:]
		order = append(order, node)
		for _, neighbor := range g.adjacency[node] {
			if !visited[neighbor] {
				visited[neighbor] = true
				queue = append(queue, neighbor)
			}
		}
	}
	return order
}

func (g *Graph) HasCycle() bool {
	visited := make(map[string]bool)
	inStack := make(map[string]bool)

	var visit func(node string) bool
	visit = func(node string) bool {
		visited[node] = true
		inStack[node] = true
		for _, neighbor := range g.adjacency[node] {
			if !visited[neighbor] {
				if visit(neighbor) {
					return true
				}
			} else if inStack[neighbor] {
				return true
			}
		}
		inStack[node] = false
		return false
	}

	for node := range g.adjacency {
		if !visited[node] && visit(node) {
			return true
		}
	}
	return false
}

func main() {
	g := NewGraph()
	g.AddEdge("A", "B", false)
	g.AddEdge("B", "C", false)
	g.AddEdge("A", "C", false)
	fmt.Println(g.BFS("A"))
	fmt.Println(g.HasCycle())
}
