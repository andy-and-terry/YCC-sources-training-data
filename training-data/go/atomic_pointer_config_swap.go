package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

// atomic.Pointer lets readers see an immutable snapshot of configuration
// while a writer swaps in a new one, with no locks on the read path.
type Config struct {
	Version int
	Name    string
}

func main() {
	var current atomic.Pointer[Config]
	current.Store(&Config{Version: 1, Name: "initial"})

	var wg sync.WaitGroup
	for i := 0; i < 3; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			cfg := current.Load()
			_ = cfg.Version // always a complete, consistent snapshot
		}()
	}
	wg.Wait()

	old := current.Swap(&Config{Version: 2, Name: "updated"})
	fmt.Println("old:", *old)
	fmt.Println("new:", *current.Load())

	snapshot := current.Load()
	next := &Config{Version: 3, Name: "compare-and-swap"}
	fmt.Println("CAS ok:", current.CompareAndSwap(snapshot, next))
	fmt.Println("CAS stale:", current.CompareAndSwap(snapshot, &Config{Version: 4}))
	fmt.Println("final:", *current.Load())
}
