package main

import "fmt"

func fourSumCount(a, b, c, d []int) int {
	sums := map[int]int{}
	for _, x := range a {
		for _, y := range b {
			sums[x+y]++
		}
	}
	count := 0
	for _, x := range c {
		for _, y := range d {
			count += sums[-(x + y)]
		}
	}
	return count
}

func main() {
	fmt.Println(fourSumCount([]int{1, 2}, []int{-2, -1}, []int{-1, 2}, []int{0, 2})) // 2
}
