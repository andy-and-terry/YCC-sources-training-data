package main

import (
	"fmt"
	"sync"
)

var (
	once sync.Once
	inst *config
)

type config struct{ name string }

func get() *config {
	once.Do(func() {
		fmt.Println("init")
		inst = &config{"prod"}
	})
	return inst
}

func main() {
	fmt.Println(get() == get(), get().name)
}
