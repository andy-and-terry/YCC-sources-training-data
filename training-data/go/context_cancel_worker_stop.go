package main

import (
	"context"
	"fmt"
	"time"
)

func main() {
	ctx, cancel := context.WithTimeout(context.Background(), 50*time.Millisecond)
	defer cancel()
	select {
	case <-ctx.Done():
		fmt.Println("stopped:", ctx.Err())
	case <-time.After(time.Second):
		fmt.Println("too slow")
	}
}
