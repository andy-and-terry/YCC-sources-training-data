package main

import (
	"context"
	"fmt"
	"time"
)

func worker(ctx context.Context, id int, out chan<- string) {
	for i := 0; ; i++ {
		select {
		case <-ctx.Done():
			out <- fmt.Sprintf("worker %d stopping: %v", id, ctx.Err())
			return
		case <-time.After(10 * time.Millisecond):
		}
	}
}

func main() {
	ctx, cancel := context.WithTimeout(context.Background(), 35*time.Millisecond)
	defer cancel()
	out := make(chan string)
	go worker(ctx, 1, out)
	fmt.Println(<-out)
}
