package main

import (
	"fmt"
	"maps"
	"slices"
)

func main() {
	m := map[string]int{"b": 2, "a": 1, "c": 3}
	keys := slices.Sorted(maps.Keys(m))
	fmt.Println(keys)
	c := maps.Clone(m)
	delete(c, "a")
	fmt.Println(len(m), len(c))
}
