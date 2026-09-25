package main

import (
	"fmt"
	"sort"
)

type job struct {
	id               string
	deadline, profit int
}

func schedule(jobs []job) ([]string, int) {
	s := append([]job(nil), jobs...)
	sort.Slice(s, func(i, j int) bool { return s[i].profit > s[j].profit })
	maxD := 0
	for _, j := range s {
		maxD = max(maxD, j.deadline)
	}
	slots := make([]string, maxD+1)
	total := 0
	for _, j := range s {
		for t := j.deadline; t > 0; t-- {
			if slots[t] == "" {
				slots[t] = j.id
				total += j.profit
				break
			}
		}
	}
	var order []string
	for _, id := range slots[1:] {
		if id != "" {
			order = append(order, id)
		}
	}
	return order, total
}

func main() {
	fmt.Println(schedule([]job{{"a", 2, 100}, {"b", 1, 19}, {"c", 2, 27}, {"d", 1, 25}, {"e", 3, 15}}))
}
