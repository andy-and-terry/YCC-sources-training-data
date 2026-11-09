package main

import (
	"fmt"
	"sync"
)

var (
	once sync.Once
	inst *int
)

func get() *int {
	once.Do(func() { v := 42; inst = &v; fmt.Println("init") })
	return inst
}

func main() {
	fmt.Println(*get(), *get())
}
