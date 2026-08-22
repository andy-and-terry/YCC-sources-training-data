package main

import "fmt"

type move struct {
	source, target string
}

func hanoi(n int, source, target, auxiliary string, moves *[]move) {
	if n == 1 {
		*moves = append(*moves, move{source, target})
		return
	}
	hanoi(n-1, source, auxiliary, target, moves)
	*moves = append(*moves, move{source, target})
	hanoi(n-1, auxiliary, target, source, moves)
}

func main() {
	var moves []move
	hanoi(3, "A", "C", "B", &moves)
	for _, m := range moves {
		fmt.Printf("%s -> %s\n", m.source, m.target)
	}
}
