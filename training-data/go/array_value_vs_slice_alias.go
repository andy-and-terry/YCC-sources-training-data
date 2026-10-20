package main

import "fmt"

func main() {
	a := [3]int{1, 2, 3}
	b := a
	b[0] = 99
	s := a[:]
	s[1] = 77
	fmt.Println(a, b, s, len(s), cap(s))
	t := append(s[:1:1], 5)
	fmt.Println(a, t)
}
