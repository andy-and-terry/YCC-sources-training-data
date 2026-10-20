package main

import (
	"fmt"
	"sync"
)

func produce(name string, n int) <-chan string {
	ch := make(chan string)
	go func() {
		defer close(ch)
		for i := 0; i < n; i++ {
			ch <- fmt.Sprintf("%s-%d", name, i)
		}
	}()
	return ch
}

func merge(chans ...<-chan string) <-chan string {
	out := make(chan string)
	var wg sync.WaitGroup
	for _, c := range chans {
		wg.Add(1)
		go func(c <-chan string) {
			defer wg.Done()
			for v := range c {
				out <- v
			}
		}(c)
	}
	go func() { wg.Wait(); close(out) }()
	return out
}

func main() {
	count := 0
	for range merge(produce("a", 3), produce("b", 4)) {
		count++
	}
	fmt.Println("received", count)
}
