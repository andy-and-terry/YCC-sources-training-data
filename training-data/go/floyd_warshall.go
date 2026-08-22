package main

import "fmt"

type fwEdge struct {
	u, v, w int
}

func floydWarshall(numNodes int, edges []fwEdge) [][]int {
	const inf = 1 << 30
	dist := make([][]int, numNodes)
	for i := range dist {
		dist[i] = make([]int, numNodes)
		for j := range dist[i] {
			dist[i][j] = inf
		}
		dist[i][i] = 0
	}
	for _, e := range edges {
		dist[e.u][e.v] = e.w
	}

	for k := 0; k < numNodes; k++ {
		for i := 0; i < numNodes; i++ {
			for j := 0; j < numNodes; j++ {
				if dist[i][k]+dist[k][j] < dist[i][j] {
					dist[i][j] = dist[i][k] + dist[k][j]
				}
			}
		}
	}
	return dist
}

func main() {
	edges := []fwEdge{{0, 1, 3}, {0, 2, 8}, {1, 2, 2}, {2, 3, 1}, {3, 0, 4}}
	for _, row := range floydWarshall(4, edges) {
		fmt.Println(row)
	}
}
