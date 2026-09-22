package main

import "fmt"

func isBipartite(graph map[int][]int) bool {
	color := make(map[int]int)
	for start := range graph {
		if _, seen := color[start]; seen {
			continue
		}
		color[start] = 0
		queue := []int{start}
		for len(queue) > 0 {
			node := queue[0]
			queue = queue[1:]
			for _, next := range graph[node] {
				if c, seen := color[next]; seen {
					if c == color[node] {
						return false
					}
					continue
				}
				color[next] = 1 - color[node]
				queue = append(queue, next)
			}
		}
	}
	return true
}

func main() {
	bipartite := map[int][]int{0: {1, 3}, 1: {0, 2}, 2: {1, 3}, 3: {0, 2}}
	notBipartite := map[int][]int{0: {1, 2}, 1: {0, 2}, 2: {0, 1}}
	fmt.Println(isBipartite(bipartite))
	fmt.Println(isBipartite(notBipartite))
}
