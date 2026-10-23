package main

import (
	"fmt"
	"sort"
)

func kaprekarSteps(n int) int {
	steps := 0
	for n != 6174 {
		d := []int{n / 1000 % 10, n / 100 % 10, n / 10 % 10, n % 10}
		sort.Ints(d)
		asc := d[0]*1000 + d[1]*100 + d[2]*10 + d[3]
		desc := d[3]*1000 + d[2]*100 + d[1]*10 + d[0]
		n = desc - asc
		steps++
	}
	return steps
}

func main() {
	fmt.Println(kaprekarSteps(3524))
}
