package main

import "fmt"

// Each call to counter returns an independent closure over its own state.
func counter(start, step int) func() int {
	n := start - step
	return func() int {
		n += step
		return n
	}
}

func main() {
	a, b := counter(0, 1), counter(100, 10)
	fmt.Println(a(), a(), a())
	fmt.Println(b(), b())
}
