package main

import "fmt"

type Number interface {
	~int | ~int64 | ~float64
}

type Celsius float64

func Sum[T Number](xs []T) T {
	var total T
	for _, x := range xs {
		total += x
	}
	return total
}

func MaxOf[T Number](xs ...T) T {
	m := xs[0]
	for _, x := range xs[1:] {
		if x > m {
			m = x
		}
	}
	return m
}

func main() {
	fmt.Println(Sum([]int{1, 2, 3, 4}))
	fmt.Println(Sum([]float64{1.5, 2.5}))
	fmt.Println(MaxOf(Celsius(21.5), Celsius(30.2), Celsius(18)))
}
