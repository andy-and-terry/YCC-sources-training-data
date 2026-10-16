package main

import (
	"context"
	"errors"
	"fmt"
	"time"
)

func slowOp(ctx context.Context, d time.Duration) error {
	select {
	case <-time.After(d):
		return nil
	case <-ctx.Done():
		return ctx.Err()
	}
}

func main() {
	ctx, cancel := context.WithTimeout(context.Background(), 50*time.Millisecond)
	defer cancel()

	fmt.Println("fast:", slowOp(ctx, 10*time.Millisecond))
	err := slowOp(ctx, 500*time.Millisecond)
	fmt.Println("slow:", err, errors.Is(err, context.DeadlineExceeded))

	dl, ok := ctx.Deadline()
	fmt.Println("has deadline:", ok, !dl.IsZero())
}
