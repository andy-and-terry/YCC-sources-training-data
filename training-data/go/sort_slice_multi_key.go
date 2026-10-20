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

// Sort by department ascending, then age descending, then name.
func main() {
	staff := []Employee{
		{"Zed", "ops", 30}, {"Amy", "dev", 41}, {"Bob", "dev", 41}, {"Cy", "dev", 25},
	}
	sort.Slice(staff, func(i, j int) bool {
		a, b := staff[i], staff[j]
		if a.Dept != b.Dept {
			return a.Dept < b.Dept
		}
		if a.Age != b.Age {
			return a.Age > b.Age
		}
		return a.Name < b.Name
	})
	for _, e := range staff {
		fmt.Println(e)
	}
}
