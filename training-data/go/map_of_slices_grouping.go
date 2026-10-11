package main

import (
	"fmt"
	"sort"
)

func main() {
	words := []string{"apple", "avocado", "banana", "blueberry", "cherry", "apricot"}
	groups := map[byte][]string{}
	for _, w := range words {
		groups[w[0]] = append(groups[w[0]], w)
	}

	keys := make([]int, 0, len(groups))
	for k := range groups {
		keys = append(keys, int(k))
	}
	sort.Ints(keys)
	for _, k := range keys {
		fmt.Printf("%c: %v\n", k, groups[byte(k)])
	}

	delete(groups, 'a')
	_, ok := groups['a']
	fmt.Println("has a:", ok, "len:", len(groups))
}
