package main

import (
	"fmt"
	"sort"
	"sync"
)

func main() {
	var m sync.Map
	var wg sync.WaitGroup

	for i := 0; i < 10; i++ {
		wg.Add(1)
		go func(n int) {
			defer wg.Done()
			m.Store(n, n*n)
		}(i)
	}
	wg.Wait()

	var keys []int
	m.Range(func(key, value any) bool {
		keys = append(keys, key.(int))
		return true
	})
	sort.Ints(keys)

	for _, k := range keys {
		v, ok := m.Load(k)
		fmt.Println(k, "->", v, ok)
	}

	m.Delete(5)
	if _, ok := m.Load(5); !ok {
		fmt.Println("key 5 deleted")
	}

	actual, loaded := m.LoadOrStore(5, 999)
	fmt.Println("loadOrStore:", actual, loaded)
}
