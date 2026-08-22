package main

import (
	"fmt"
	"math"
)

type bfEdge struct {
	u, v, w int
}

func bellmanFord(numNodes int, edges []bfEdge, source int) []int {
	dist := make([]int, numNodes)
	for i := range dist {
		dist[i] = math.MaxInt32
	}
	dist[source] = 0

	for i := 0; i < numNodes-1; i++ {
		for _, e := range edges {
			if dist[e.u] != math.MaxInt32 && dist[e.u]+e.w < dist[e.v] {
				dist[e.v] = dist[e.u] + e.w
			}
		}
	}

	for _, e := range edges {
		if dist[e.u] != math.MaxInt32 && dist[e.u]+e.w < dist[e.v] {
			panic("graph contains a negative-weight cycle")
		}
	}

	return dist
}

func main() {
	edges := []bfEdge{{0, 1, 4}, {0, 2, 5}, {1, 2, -3}, {2, 3, 4}}
	fmt.Println(bellmanFord(4, edges, 0))
}
