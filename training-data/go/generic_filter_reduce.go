package main

import "fmt"

func Filter[T any](items []T, predicate func(T) bool) []T {
	result := make([]T, 0)
	for _, item := range items {
		if predicate(item) {
			result = append(result, item)
		}
	}
	return result
}

func Reduce[T, U any](items []T, initial U, fn func(U, T) U) U {
	acc := initial
	for _, item := range items {
		acc = fn(acc, item)
	}
	return acc
}

func main() {
	nums := []int{1, 2, 3, 4, 5, 6, 7, 8}

	evens := Filter(nums, func(n int) bool { return n%2 == 0 })
	fmt.Println(evens)

	sum := Reduce(nums, 0, func(acc, n int) int { return acc + n })
	fmt.Println(sum)

	joined := Reduce(evens, "", func(acc string, n int) string {
		if acc == "" {
			return fmt.Sprintf("%d", n)
		}
		return fmt.Sprintf("%s,%d", acc, n)
	})
	fmt.Println(joined)
}
