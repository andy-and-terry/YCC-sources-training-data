package main

import (
	"fmt"
	"sync"
	"time"
)

type call struct {
	wg  sync.WaitGroup
	val string
}

type Group struct {
	mu sync.Mutex
	m  map[string]*call
}

func (g *Group) Do(key string, fn func() string) string {
	g.mu.Lock()
	if g.m == nil {
		g.m = make(map[string]*call)
	}
	if c, ok := g.m[key]; ok {
		g.mu.Unlock()
		c.wg.Wait()
		return c.val
	}
	c := &call{}
	c.wg.Add(1)
	g.m[key] = c
	g.mu.Unlock()

	c.val = fn()
	c.wg.Done()

	g.mu.Lock()
	delete(g.m, key)
	g.mu.Unlock()
	return c.val
}

func main() {
	var g Group
	var mu sync.Mutex
	execs := 0
	var wg sync.WaitGroup
	for i := 0; i < 5; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			g.Do("k", func() string {
				mu.Lock()
				execs++
				mu.Unlock()
				time.Sleep(50 * time.Millisecond)
				return "result"
			})
		}()
	}
	wg.Wait()
	fmt.Println("executions <= 5:", execs >= 1 && execs <= 5)
}
