package main

import (
	"errors"
	"fmt"
	"sync"
)

func work(id int) error {
	if id%3 == 0 {
		return fmt.Errorf("task %d failed", id)
	}
	return nil
}

func main() {
	var wg sync.WaitGroup
	var mu sync.Mutex
	var errs []error

	for i := 1; i <= 7; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			if err := work(i); err != nil {
				mu.Lock()
				errs = append(errs, err)
				mu.Unlock()
			}
		}()
	}
	wg.Wait()
	fmt.Println(len(errs), "errors")
	joined := errors.Join(errs...)
	fmt.Println(joined != nil)
}
