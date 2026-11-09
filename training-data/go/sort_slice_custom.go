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
	ps := []P{{"Ann", 31}, {"Bob", 25}, {"Cy", 40}}
	sort.Slice(ps, func(i, j int) bool { return ps[i].Age < ps[j].Age })
	fmt.Println(ps)
}
