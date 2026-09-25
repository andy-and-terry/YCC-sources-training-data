package main

import "fmt"

func rob(h []int) int {
	take, skip := 0, 0
	for _, v := range h {
		take, skip = skip+v, max(take, skip)
	}
	return max(take, skip)
}

func robCircle(h []int) int {
	if len(h) == 1 {
		return h[0]
	}
	return max(rob(h[1:]), rob(h[:len(h)-1]))
}

func main() {
	fmt.Println(rob([]int{2, 7, 9, 3, 1}), robCircle([]int{2, 3, 2}), robCircle([]int{1, 2, 3, 1}))
}
