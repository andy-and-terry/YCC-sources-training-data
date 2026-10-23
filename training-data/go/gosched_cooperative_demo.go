package main

import (
	"fmt"
	"runtime"
	"sync"
)

func main() {
	// Pin to one OS thread so scheduling is easy to reason about.
	runtime.GOMAXPROCS(1)

	var wg sync.WaitGroup
	order := make(chan string, 6)

	worker := func(name string) {
		defer wg.Done()
		for i := 1; i <= 3; i++ {
			order <- fmt.Sprintf("%s%d", name, i)
			runtime.Gosched() // yield so the other goroutine can run
		}
	}

	wg.Add(2)
	go worker("A")
	go worker("B")
	wg.Wait()
	close(order)

	// Each goroutine yields, so they interleave rather than run in blocks.
	count := 0
	for s := range order {
		fmt.Print(s, " ")
		count++
	}
	fmt.Println()
	fmt.Println("total:", count, "goroutines now:", runtime.NumGoroutine())
}
