package main

import (
	"context"
	"fmt"
	"sync"
	"time"
)

func poll(ctx context.Context, id int, wg *sync.WaitGroup) {
	defer wg.Done()
	for {
		select {
		case <-ctx.Done():
			fmt.Printf("worker %d stopping: %v\n", id, ctx.Err())
			return
		case <-time.After(5 * time.Millisecond):
			fmt.Printf("worker %d polling\n", id)
		}
	}
}

func main() {
	ctx, cancel := context.WithCancel(context.Background())

	var wg sync.WaitGroup
	for i := 1; i <= 3; i++ {
		wg.Add(1)
		go poll(ctx, i, &wg)
	}

	time.Sleep(15 * time.Millisecond)
	cancel()
	wg.Wait()
	fmt.Println("all workers stopped")
}
