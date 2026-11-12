package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

func main() {
	var n int64
	var wg sync.WaitGroup
	for i := 0; i < 50; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for {
				old := atomic.LoadInt64(&n)
				if atomic.CompareAndSwapInt64(&n, old, old+2) {
					return
				}
			}
		}()
	}
	wg.Wait()
	fmt.Println(n)
}
