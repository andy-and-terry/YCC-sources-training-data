package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

type Config struct {
	Name    string
	Version int
}

func main() {
	var current atomic.Value
	current.Store(&Config{Name: "app", Version: 1})

	var wg sync.WaitGroup
	for i := 0; i < 3; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			cfg := current.Load().(*Config)
			_ = cfg.Name
		}()
	}
	wg.Wait()

	current.Store(&Config{Name: "app", Version: 2})
	cfg := current.Load().(*Config)
	fmt.Printf("%s v%d\n", cfg.Name, cfg.Version)

	var ptr atomic.Pointer[Config]
	ptr.Store(&Config{Name: "typed", Version: 7})
	old := ptr.Swap(&Config{Name: "typed", Version: 8})
	fmt.Println(old.Version, ptr.Load().Version)
}
