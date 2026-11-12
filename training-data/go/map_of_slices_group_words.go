package main

import "fmt"

func main() {
	g := map[int][]string{}
	for _, w := range []string{"a", "bb", "cc", "d", "eee"} {
		g[len(w)] = append(g[len(w)], w)
	}
	fmt.Println(g)
}
