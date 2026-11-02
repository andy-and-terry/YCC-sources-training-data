package main

import "fmt"

func main() {
	words := []string{"ant", "bee", "ape", "bat"}
	g := map[byte][]string{}
	for _, w := range words {
		g[w[0]] = append(g[w[0]], w)
	}
	fmt.Println(g['a'], g['b'])
}
