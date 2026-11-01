package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

func main() {
	var n atomic.Int64
	var wg sync.WaitGroup
	for i := 0; i < 50; i++ {
		wg.Add(1)
		go func() { defer wg.Done(); n.Add(2) }()
	}
	wg.Wait()
	fmt.Println(n.Load())
}
