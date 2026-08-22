package main

import (
	"fmt"
	"sync"
)

type rwCache struct {
	mu   sync.RWMutex
	data map[string]int
}

func newRWCache() *rwCache {
	return &rwCache{data: make(map[string]int)}
}

func (c *rwCache) Get(key string) (int, bool) {
	c.mu.RLock()
	defer c.mu.RUnlock()
	v, ok := c.data[key]
	return v, ok
}

func (c *rwCache) Set(key string, value int) {
	c.mu.Lock()
	defer c.mu.Unlock()
	c.data[key] = value
}

func main() {
	cache := newRWCache()
	var wg sync.WaitGroup
	for i := 0; i < 10; i++ {
		wg.Add(1)
		go func(n int) {
			defer wg.Done()
			cache.Set(fmt.Sprintf("key%d", n), n)
		}(i)
	}
	wg.Wait()
	v, ok := cache.Get("key5")
	fmt.Println(v, ok)
}
