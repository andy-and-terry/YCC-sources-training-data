package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

type config struct {
	limit int
	name  string
}

func main() {
	var cfg atomic.Value
	cfg.Store(&config{limit: 1, name: "v1"})

	var wg sync.WaitGroup
	for i := 0; i < 4; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			_ = cfg.Load().(*config).limit
		}()
	}
	cfg.Store(&config{limit: 2, name: "v2"})
	wg.Wait()
	fmt.Println(cfg.Load().(*config).name)

	var p atomic.Pointer[config]
	p.Store(&config{name: "typed"})
	fmt.Println(p.Load().name)
	var n atomic.Int64
	n.Add(5)
	fmt.Println(n.CompareAndSwap(5, 9), n.Load())
}
