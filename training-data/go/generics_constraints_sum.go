package main

import "fmt"

type Number interface {
	~int | ~int64 | ~float64
}

func Sum[T Number](xs []T) T {
	var s T
	for _, x := range xs {
		s += x
	}
	return s
}

type Celsius float64

func main() {
	fmt.Println(Sum([]int{1, 2, 3}))
	fmt.Println(Sum([]Celsius{1.5, 2.5}))
}
