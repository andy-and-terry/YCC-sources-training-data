package main

import (
	"fmt"
	"time"
)

func slowOperation(d time.Duration) <-chan string {
	ch := make(chan string, 1)
	go func() {
		time.Sleep(d)
		ch <- "done"
	}()
	return ch
}

func main() {
	for _, d := range []time.Duration{10 * time.Millisecond, 200 * time.Millisecond} {
		select {
		case res := <-slowOperation(d):
			fmt.Println(res)
		case <-time.After(50 * time.Millisecond):
			fmt.Println("timeout")
		}
	}
}
