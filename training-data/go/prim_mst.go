package main

import "fmt"

const primInf = int(1e9)

func primMST(numNodes int, adj [][]int) int {
	inMST := make([]bool, numNodes)
	key := make([]int, numNodes)
	for i := range key {
		key[i] = primInf
	}
	key[0] = 0
	total := 0

	for count := 0; count < numNodes; count++ {
		u := -1
		for v := 0; v < numNodes; v++ {
			if !inMST[v] && (u == -1 || key[v] < key[u]) {
				u = v
			}
		}
		inMST[u] = true
		total += key[u]
		for v := 0; v < numNodes; v++ {
			if adj[u][v] != 0 && !inMST[v] && adj[u][v] < key[v] {
				key[v] = adj[u][v]
			}
		}
	}
	return total
}

func main() {
	adj := [][]int{
		{0, 2, 0, 6, 0},
		{2, 0, 3, 8, 5},
		{0, 3, 0, 0, 7},
		{6, 8, 0, 0, 9},
		{0, 5, 7, 9, 0},
	}
	fmt.Println(primMST(5, adj))
}
