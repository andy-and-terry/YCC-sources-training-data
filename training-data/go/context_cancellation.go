package main

import (
	"context"
	"fmt"
	"time"
)

func worker(ctx context.Context, id int, results chan<- string) {
	select {
	case <-time.After(50 * time.Millisecond):
		results <- fmt.Sprintf("worker %d finished", id)
	case <-ctx.Done():
		results <- fmt.Sprintf("worker %d cancelled: %v", id, ctx.Err())
	}
}

func main() {
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Millisecond)
	defer cancel()

	results := make(chan string, 1)
	go worker(ctx, 1, results)

	fmt.Println(<-results)
}
