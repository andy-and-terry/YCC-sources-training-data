package main

import "fmt"

func isSafe(graph [][]int, colors []int, node, color int) bool {
	for neighbor, connected := range graph[node] {
		if connected == 1 && colors[neighbor] == color {
			return false
		}
	}
	return true
}

func colorGraph(graph [][]int, colors []int, node, numColors int) bool {
	if node == len(graph) {
		return true
	}
	for color := 1; color <= numColors; color++ {
		if isSafe(graph, colors, node, color) {
			colors[node] = color
			if colorGraph(graph, colors, node+1, numColors) {
				return true
			}
			colors[node] = 0
		}
	}
	return false
}

func main() {
	graph := [][]int{
		{0, 1, 1, 1},
		{1, 0, 1, 0},
		{1, 1, 0, 1},
		{1, 0, 1, 0},
	}

	colors := make([]int, len(graph))
	if colorGraph(graph, colors, 0, 3) {
		fmt.Println("coloring found:", colors)
	} else {
		fmt.Println("no valid coloring with given colors")
	}

	if !colorGraph(graph, make([]int, len(graph)), 0, 2) {
		fmt.Println("2 colors insufficient for this graph")
	}
}
