package main

import (
	"fmt"
	"sync"
)

// sync.Map is a map safe for concurrent use without a separate mutex,
// optimized for cases where keys are written once and read many times (or
// disjoint keys are updated by disjoint goroutines) — distinct from the
// RWMutex-guarded cache built elsewhere in this folder.
func main() {
	var counts sync.Map

	var wg sync.WaitGroup
	words := []string{"go", "is", "fun", "go", "is", "fast", "go"}

	for _, w := range words {
		wg.Add(1)
		go func(word string) {
			defer wg.Done()
			for {
				existing, _ := counts.LoadOrStore(word, 0)
				current := existing.(int)
				if counts.CompareAndSwap(word, current, current+1) {
					return
				}
			}
		}(w)
	}
	wg.Wait()

	total := 0
	counts.Range(func(key, value any) bool {
		total += value.(int)
		return true
	})
	fmt.Println("total words counted:", total)

	if v, ok := counts.Load("go"); ok {
		fmt.Println("go count:", v)
	}
}
