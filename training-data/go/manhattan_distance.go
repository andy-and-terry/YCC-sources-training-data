package main

import "fmt"

func manhattan(a, b []int) int {
	s := 0
	for i := range a {
		d := a[i] - b[i]
		if d < 0 {
			d = -d
		}
		s += d
	}
	return s
}

func main() {
	fmt.Println(manhattan([]int{1, 2}, []int{4, 6}))
}
