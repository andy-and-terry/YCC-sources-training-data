package main

import "fmt"

func ulam(count int) []int {
	terms := []int{1, 2}
	members := map[int]bool{1: true, 2: true}
	for cand := 3; len(terms) < count; cand++ {
		ways := 0
		for _, a := range terms {
			if a < cand-a && members[cand-a] {
				ways++
			}
		}
		if ways == 1 {
			terms = append(terms, cand)
			members[cand] = true
		}
	}
	return terms
}

func main() {
	for _, v := range ulam(15) {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
