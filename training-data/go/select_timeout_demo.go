package main

import (
	"fmt"
	"time"
)

func slowWorker(delay time.Duration) <-chan string {
	out := make(chan string, 1)
	go func() {
		time.Sleep(delay)
		out <- fmt.Sprintf("done after %v", delay)
	}()
	return out
}

func waitFor(name string, ch <-chan string, timeout time.Duration) {
	select {
	case msg := <-ch:
		fmt.Printf("%s: %s\n", name, msg)
	case <-time.After(timeout):
		fmt.Printf("%s: timed out after %v\n", name, timeout)
	}
}

func main() {
	waitFor("fast", slowWorker(10*time.Millisecond), 200*time.Millisecond)
	waitFor("slow", slowWorker(300*time.Millisecond), 50*time.Millisecond)
}
