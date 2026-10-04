package main

import (
	"fmt"
	"sort"
)

type Employee struct {
	Name   string
	Dept   string
	Salary int
}

func main() {
	staff := []Employee{
		{"Alice", "Eng", 120},
		{"Bob", "Eng", 100},
		{"Carol", "Ops", 100},
		{"Dave", "Ops", 90},
		{"Eve", "Eng", 120},
	}

	// Sort by department ascending, then salary descending, then name.
	sort.SliceStable(staff, func(i, j int) bool {
		a, b := staff[i], staff[j]
		if a.Dept != b.Dept {
			return a.Dept < b.Dept
		}
		if a.Salary != b.Salary {
			return a.Salary > b.Salary
		}
		return a.Name < b.Name
	})

	for _, e := range staff {
		fmt.Printf("%-4s %-5s %d\n", e.Dept, e.Name, e.Salary)
	}
}
