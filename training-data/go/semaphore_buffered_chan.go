package main

import (
	"fmt"
	"sync"
)

func main() {
	sem := make(chan struct{}, 2)
	var wg sync.WaitGroup
	var mu sync.Mutex
	active, peak := 0, 0
	for i := 0; i < 6; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			sem <- struct{}{}
			mu.Lock()
			active++
			if active > peak {
				peak = active
			}
			mu.Unlock()
			mu.Lock()
			active--
			mu.Unlock()
			<-sem
		}()
	}
	wg.Wait()
	fmt.Println(peak <= 2)
}
