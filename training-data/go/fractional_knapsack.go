package main

import (
	"fmt"
	"sort"
)

type item struct {
	name          string
	value, weight float64
}

func fractionalKnapsack(items []item, capacity float64) float64 {
	sorted := append([]item(nil), items...)
	sort.Slice(sorted, func(i, j int) bool { return sorted[i].value/sorted[i].weight > sorted[j].value/sorted[j].weight })
	total := 0.0
	for _, it := range sorted {
		if capacity <= 0 {
			break
		}
		take := min(it.weight, capacity)
		total += it.value * take / it.weight
		capacity -= take
		fmt.Printf("take %.1f of %s\n", take, it.name)
	}
	return total
}

func main() {
	fmt.Println("total", fractionalKnapsack([]item{{"gold", 60, 10}, {"silver", 100, 20}, {"bronze", 120, 30}}, 50))
}
