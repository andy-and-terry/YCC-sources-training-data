package main

import (
	"cmp"
	"fmt"
	"slices"
)

func Keys[K comparable, V any](m map[K]V) []K {
	out := make([]K, 0, len(m))
	for k := range m {
		out = append(out, k)
	}
	return out
}

func Values[K comparable, V any](m map[K]V) []V {
	out := make([]V, 0, len(m))
	for _, v := range m {
		out = append(out, v)
	}
	return out
}

func SortedKeys[K cmp.Ordered, V any](m map[K]V) []K {
	keys := Keys(m)
	slices.Sort(keys)
	return keys
}

func main() {
	stock := map[string]int{"apple": 5, "pear": 0, "fig": 12}

	fmt.Println(SortedKeys(stock))
	vals := Values(stock)
	slices.Sort(vals)
	fmt.Println(vals)

	for _, k := range SortedKeys(stock) {
		fmt.Printf("%s=%d\n", k, stock[k])
	}
}
