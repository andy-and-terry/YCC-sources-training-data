package main

import (
	"context"
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	ctx, stop := signal.NotifyContext(context.Background(), os.Interrupt, syscall.SIGTERM)
	defer stop()

	// Deliver a signal to ourselves so the example terminates.
	_ = syscall.Kill(os.Getpid(), syscall.SIGTERM)

	<-ctx.Done()
	fmt.Println("shutting down:", ctx.Err())
}
