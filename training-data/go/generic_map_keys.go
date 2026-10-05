package main

import (
	"cmp"
	"fmt"
	"slices"
)

func SortedKeys[K cmp.Ordered, V any](m map[K]V) []K {
	keys := make([]K, 0, len(m))
	for k := range m {
		keys = append(keys, k)
	}
	slices.Sort(keys)
	return keys
}

func MapValues[K comparable, V, R any](m map[K]V, f func(V) R) map[K]R {
	out := make(map[K]R, len(m))
	for k, v := range m {
		out[k] = f(v)
	}
	return out
}

func main() {
	prices := map[string]float64{"pear": 1.5, "apple": 0.5, "fig": 3}
	for _, k := range SortedKeys(prices) {
		fmt.Printf("%s=%.2f\n", k, prices[k])
	}
	doubled := MapValues(prices, func(p float64) float64 { return p * 2 })
	fmt.Println(doubled["fig"])
}
