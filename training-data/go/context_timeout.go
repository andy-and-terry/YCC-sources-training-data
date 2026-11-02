package main

import (
	"context"
	"fmt"
	"time"
)

func main() {
	ctx, cancel := context.WithTimeout(context.Background(), 20*time.Millisecond)
	defer cancel()
	select {
	case <-time.After(time.Second):
		fmt.Println("done")
	case <-ctx.Done():
		fmt.Println(ctx.Err())
	}
}
