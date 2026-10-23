package main

import "fmt"

func main() {
	m := map[string]int{"a": 1, "b": 2, "c": 3}
	fmt.Println("before clear:", len(m))
	clear(m)
	fmt.Println("after clear:", len(m))

	s := []int{1, 2, 3}
	clear(s)
	fmt.Println(s)

	fmt.Println(min(3, 1, 2), max(3, 1, 2))
	fmt.Println(min(2.5, 1.5), max("apple", "pear"))
}
