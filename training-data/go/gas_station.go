package main

import "fmt"

func startStation(gas, cost []int) int {
	total, tank, start := 0, 0, 0
	for i := range gas {
		d := gas[i] - cost[i]
		total += d
		tank += d
		if tank < 0 {
			start, tank = i+1, 0
		}
	}
	if total < 0 {
		return -1
	}
	return start
}

func main() {
	fmt.Println(startStation([]int{1, 2, 3, 4, 5}, []int{3, 4, 5, 1, 2}), startStation([]int{2, 3, 4}, []int{3, 4, 3}))
}
