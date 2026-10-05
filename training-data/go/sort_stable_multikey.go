package main

import (
	"cmp"
	"fmt"
	"slices"
)

type Person struct {
	Name string
	Age  int
}

func main() {
	people := []Person{{"Alice", 30}, {"Bob", 25}, {"Carol", 30}, {"Dave", 25}}
	slices.SortStableFunc(people, func(a, b Person) int {
		if c := cmp.Compare(b.Age, a.Age); c != 0 {
			return c
		}
		return cmp.Compare(a.Name, b.Name)
	})
	fmt.Println(people)
}
