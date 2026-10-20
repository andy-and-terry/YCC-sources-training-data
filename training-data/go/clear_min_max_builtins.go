package main

import "fmt"

func main() {
	m := map[string]int{"a": 1, "b": 2}
	s := []int{1, 2, 3}
	clear(m)
	clear(s) // zeroes elements, keeps length
	fmt.Println(len(m), s)
	fmt.Println(min(3, 1, 2), max(2.5, 1), min("b", "a"))
}
