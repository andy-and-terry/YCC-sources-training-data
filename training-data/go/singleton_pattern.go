package main

import (
	"fmt"
	"sync"
)

type singleton struct {
	Value int
}

var instance *singleton
var once sync.Once

func getInstance(value int) *singleton {
	once.Do(func() {
		instance = &singleton{Value: value}
	})
	return instance
}

func main() {
	a := getInstance(1)
	b := getInstance(2)
	fmt.Println(a == b, a.Value, b.Value)
}
