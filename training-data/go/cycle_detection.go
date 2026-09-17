package main

import "fmt"

func hasCycle(graph map[int][]int) bool {
	const (
		white = 0
		gray  = 1
		black = 2
	)
	state := make(map[int]int)

	var visit func(node int) bool
	visit = func(node int) bool {
		state[node] = gray
		for _, next := range graph[node] {
			if state[next] == gray {
				return true
			}
			if state[next] == white && visit(next) {
				return true
			}
		}
		state[node] = black
		return false
	}

	for node := range graph {
		if state[node] == white {
			if visit(node) {
				return true
			}
		}
	}
	return false
}

func main() {
	acyclic := map[int][]int{0: {1}, 1: {2}, 2: {}}
	cyclic := map[int][]int{0: {1}, 1: {2}, 2: {0}}
	fmt.Println(hasCycle(acyclic))
	fmt.Println(hasCycle(cyclic))
}
