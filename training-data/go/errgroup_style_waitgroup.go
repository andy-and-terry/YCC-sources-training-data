package main

import (
	"errors"
	"fmt"
	"sync"
)

func main() {
	var wg sync.WaitGroup
	var mu sync.Mutex
	var errs []error
	for i := 0; i < 4; i++ {
		wg.Add(1)
		go func(i int) {
			defer wg.Done()
			if i%2 == 1 {
				mu.Lock()
				errs = append(errs, fmt.Errorf("task %d failed", i))
				mu.Unlock()
			}
		}(i)
	}
	wg.Wait()
	fmt.Println(len(errs), errors.Join(errs...) != nil)
}
