package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

type atomicCounter struct {
	value int64
}

func (c *atomicCounter) Increment() {
	atomic.AddInt64(&c.value, 1)
}

func (c *atomicCounter) Value() int64 {
	return atomic.LoadInt64(&c.value)
}

func main() {
	counter := &atomicCounter{}
	var wg sync.WaitGroup
	for i := 0; i < 100; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			counter.Increment()
		}()
	}
	wg.Wait()
	fmt.Println(counter.Value())
}
