package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

func main() {
	var hits atomic.Int64
	var wg sync.WaitGroup
	for i := 0; i < 50; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			hits.Add(2)
		}()
	}
	wg.Wait()
	fmt.Println(hits.Load(), hits.CompareAndSwap(100, 0), hits.Load())
}
