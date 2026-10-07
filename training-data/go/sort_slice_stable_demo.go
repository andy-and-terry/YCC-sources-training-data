package main

import (
	"fmt"
	"sort"
)

type Employee struct {
	Name string
	Dept string
	Age  int
}

func main() {
	staff := []Employee{
		{"Ana", "eng", 31},
		{"Bo", "ops", 28},
		{"Cy", "eng", 25},
		{"Di", "ops", 40},
		{"Ed", "eng", 31},
	}

	// Sort by age first, then stable-sort by dept so equal depts keep age order.
	sort.SliceStable(staff, func(i, j int) bool { return staff[i].Age < staff[j].Age })
	sort.SliceStable(staff, func(i, j int) bool { return staff[i].Dept < staff[j].Dept })

	for _, e := range staff {
		fmt.Printf("%-3s %-4s %d\n", e.Name, e.Dept, e.Age)
	}

	idx := sort.Search(len(staff), func(i int) bool { return staff[i].Dept >= "ops" })
	fmt.Println("first ops index:", idx)
}
