package main

import (
	"fmt"
	"math/rand"
)

func shuffle[T any](items []T, r *rand.Rand) {
	for i := len(items) - 1; i > 0; i-- {
		j := r.Intn(i + 1)
		items[i], items[j] = items[j], items[i]
	}
}

func main() {
	r := rand.New(rand.NewSource(42))

	deck := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	shuffle(deck, r)
	fmt.Println(deck)

	letters := []string{"a", "b", "c", "d", "e"}
	shuffle(letters, r)
	fmt.Println(letters)
}
