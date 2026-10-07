package main

import "fmt"

func fibonacciGen() func() int {
	a, b := 0, 1
	return func() int {
		v := a
		a, b = b, a+b
		return v
	}
}

func counter(step int) (inc func() int, reset func()) {
	n := 0
	inc = func() int {
		n += step
		return n
	}
	reset = func() { n = 0 }
	return
}

func main() {
	next := fibonacciGen()
	for i := 0; i < 10; i++ {
		fmt.Print(next(), " ")
	}
	fmt.Println()

	inc, reset := counter(5)
	fmt.Println(inc(), inc(), inc())
	reset()
	fmt.Println(inc())

	// Each loop iteration gets its own variable since Go 1.22.
	var funcs []func() int
	for i := 0; i < 3; i++ {
		funcs = append(funcs, func() int { return i * i })
	}
	for _, f := range funcs {
		fmt.Print(f(), " ")
	}
	fmt.Println()
}
