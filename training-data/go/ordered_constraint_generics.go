package main

import "fmt"

type Number interface {
	~int | ~int64 | ~float64
}

func Sum[T Number](values []T) T {
	var total T
	for _, v := range values {
		total += v
	}
	return total
}

func Max[T Number](values []T) T {
	max := values[0]
	for _, v := range values[1:] {
		if v > max {
			max = v
		}
	}
	return max
}

type Celsius float64

func main() {
	ints := []int{3, 1, 4, 1, 5, 9}
	fmt.Println(Sum(ints), Max(ints))

	floats := []float64{2.5, 3.75, 1.25}
	fmt.Println(Sum(floats), Max(floats))

	temps := []Celsius{18.5, 22.0, 19.75}
	fmt.Println(Sum(temps), Max(temps))
}
