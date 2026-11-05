package main

import (
	"fmt"
	"sort"
)

type P struct {
	Name string
	Age  int
}

func main() {
	ps := []P{{"b", 30}, {"a", 30}, {"c", 25}}
	sort.SliceStable(ps, func(i, j int) bool {
		if ps[i].Age != ps[j].Age {
			return ps[i].Age < ps[j].Age
		}
		return ps[i].Name < ps[j].Name
	})
	fmt.Println(ps)
}
