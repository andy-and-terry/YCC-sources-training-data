package main

import (
	"fmt"
	"sync"
	"time"
)

func main() {
	const maxConcurrent = 2
	sem := make(chan struct{}, maxConcurrent)

	var mu sync.Mutex
	var active, peak int
	var wg sync.WaitGroup

	acquire := func() {
		sem <- struct{}{}
		mu.Lock()
		active++
		if active > peak {
			peak = active
		}
		mu.Unlock()
	}
	release := func() {
		mu.Lock()
		active--
		mu.Unlock()
		<-sem
	}

	for i := 0; i < 5; i++ {
		wg.Add(1)
		go func(id int) {
			defer wg.Done()
			acquire()
			defer release()
			time.Sleep(5 * time.Millisecond)
		}(i)
	}
	wg.Wait()
	fmt.Println(peak <= maxConcurrent)
}
