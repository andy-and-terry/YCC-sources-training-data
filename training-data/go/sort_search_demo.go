package main

import (
	"fmt"
	"sort"
)

type Person struct {
	Name string
	Age  int
}

func main() {
	people := []Person{{"Al", 30}, {"Bo", 25}, {"Cy", 30}, {"Di", 22}}
	sort.SliceStable(people, func(i, j int) bool { return people[i].Age < people[j].Age })
	fmt.Println(people)

	xs := []int{1, 3, 5, 7, 9}
	i := sort.Search(len(xs), func(i int) bool { return xs[i] >= 6 })
	fmt.Println(i, xs[i])
	fmt.Println(sort.SearchInts(xs, 5), sort.IntsAreSorted(xs))

	sort.Sort(sort.Reverse(sort.IntSlice(xs)))
	fmt.Println(xs)
}
