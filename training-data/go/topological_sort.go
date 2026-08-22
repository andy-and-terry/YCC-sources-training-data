package main

import "fmt"

func topologicalSort(numNodes int, edges [][2]int) []int {
	graph := make([][]int, numNodes)
	inDegree := make([]int, numNodes)
	for _, e := range edges {
		graph[e[0]] = append(graph[e[0]], e[1])
		inDegree[e[1]]++
	}

	var queue []int
	for n := 0; n < numNodes; n++ {
		if inDegree[n] == 0 {
			queue = append(queue, n)
		}
	}

	var order []int
	for len(queue) > 0 {
		node := queue[0]
		queue = queue[1:]
		order = append(order, node)
		for _, neighbor := range graph[node] {
			inDegree[neighbor]--
			if inDegree[neighbor] == 0 {
				queue = append(queue, neighbor)
			}
		}
	}

	if len(order) != numNodes {
		panic("graph has a cycle")
	}
	return order
}

func main() {
	edges := [][2]int{{5, 2}, {5, 0}, {4, 0}, {4, 1}, {2, 3}, {3, 1}}
	fmt.Println(topologicalSort(6, edges))
}
