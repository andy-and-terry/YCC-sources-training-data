package main

import (
	"fmt"
	"sort"
)

type Person struct {
	Name string
	Age  int
}

type ByAge []Person

func (a ByAge) Len() int           { return len(a) }
func (a ByAge) Swap(i, j int)      { a[i], a[j] = a[j], a[i] }
func (a ByAge) Less(i, j int) bool { return a[i].Age < a[j].Age }

func main() {
	people := []Person{{"Alice", 30}, {"Bob", 25}, {"Carol", 35}, {"Dan", 20}}
	sort.Sort(ByAge(people))
	fmt.Println(people)
	sort.Sort(sort.Reverse(ByAge(people)))
	fmt.Println(people)
	fmt.Println(sort.IsSorted(ByAge(people)))
}
