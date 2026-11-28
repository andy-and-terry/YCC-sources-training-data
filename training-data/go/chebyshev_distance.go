package main

import "fmt"

func chebyshev(a, b []int) int {
	m := 0
	for i := range a {
		d := a[i] - b[i]
		if d < 0 {
			d = -d
		}
		if d > m {
			m = d
		}
	}
	return m
}

func main() {
	fmt.Println(chebyshev([]int{1, 2}, []int{4, 6}))
}
