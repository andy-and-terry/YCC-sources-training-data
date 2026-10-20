package main

import (
	"fmt"
	"sync"
)

func main() {
	calls := 0
	load := sync.OnceValue(func() int {
		calls++
		return 42
	})
	fmt.Println(load(), load(), calls)

	parse := sync.OnceValues(func() (string, error) { return "cfg", nil })
	v, err := parse()
	fmt.Println(v, err)

	f := sync.OnceFunc(func() { fmt.Println("once") })
	f()
	f()
}
