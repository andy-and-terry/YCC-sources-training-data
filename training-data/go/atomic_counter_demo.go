package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

func main() {
	var counter atomic.Int64
	var wg sync.WaitGroup

	for i := 0; i < 100; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			counter.Add(1)
		}()
	}
	wg.Wait()
	fmt.Println(counter.Load())

	var flag atomic.Bool
	flag.Store(true)
	if flag.CompareAndSwap(true, false) {
		fmt.Println("flag was true, now false")
	}
	fmt.Println(flag.Load())
}
