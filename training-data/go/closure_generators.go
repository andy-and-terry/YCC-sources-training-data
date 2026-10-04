package main

import "fmt"

func counter(start, step int) func() int {
	n := start - step
	return func() int {
		n += step
		return n
	}
}

func fibGen() func() int {
	a, b := 0, 1
	return func() int {
		r := a
		a, b = b, a+b
		return r
	}
}

func main() {
	c := counter(10, 5)
	fmt.Println(c(), c(), c())
	f := fibGen()
	for i := 0; i < 10; i++ {
		fmt.Print(f(), " ")
	}
	fmt.Println()
}
