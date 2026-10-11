package main

import "fmt"

func main() {
	// Deferred calls run in LIFO order; arguments are evaluated immediately.
	for i := 0; i < 3; i++ {
		defer fmt.Println("defer arg:", i)
	}

	// Closure captures the variable; Go 1.22+ gives each iteration its own copy.
	var funcs []func() int
	for i := 0; i < 3; i++ {
		funcs = append(funcs, func() int { return i * i })
	}
	for _, f := range funcs {
		fmt.Println("closure:", f())
	}

	x := 1
	defer func() { fmt.Println("deferred closure sees x =", x) }()
	x = 99
}
