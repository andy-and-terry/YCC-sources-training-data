package main

import "fmt"

func counter() func() int {
	c := 0
	return func() int {
		c++
		return c
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
	c1, c2 := counter(), counter()
	fmt.Println(c1(), c1(), c2())
	f := fibGen()
	for i := 0; i < 10; i++ {
		fmt.Print(f(), " ")
	}
	fmt.Println()
}
