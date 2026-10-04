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
	people := []Person{{"Ann", 30}, {"Bob", 25}, {"Cid", 30}, {"Dee", 25}}
	sort.SliceStable(people, func(i, j int) bool {
		if people[i].Age != people[j].Age {
			return people[i].Age > people[j].Age
		}
		return people[i].Name < people[j].Name
	})
	fmt.Println(people)

	nums := []int{1, 3, 5, 7, 9}
	idx := sort.SearchInts(nums, 6)
	fmt.Println("insert 6 at", idx)
}
