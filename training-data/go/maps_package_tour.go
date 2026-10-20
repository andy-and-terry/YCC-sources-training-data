package main

import (
	"fmt"
	"maps"
	"slices"
)

func main() {
	m := map[string]int{"a": 1, "b": 2, "c": 3}
	keys := slices.Sorted(maps.Keys(m))
	fmt.Println(keys)
	c := maps.Clone(m)
	c["d"] = 4
	fmt.Println(len(m), len(c), maps.Equal(m, c))
	maps.DeleteFunc(c, func(k string, v int) bool { return v%2 == 0 })
	fmt.Println(c)
	maps.Copy(m, map[string]int{"z": 26})
	fmt.Println(slices.Sorted(maps.Values(m)))
}
