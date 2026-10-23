package main

import (
	"fmt"
	"time"
)

func main() {
	ch := make(chan string)
	go func() {
		time.Sleep(50 * time.Millisecond)
		ch <- "done"
	}()

	select {
	case v := <-ch:
		fmt.Println("early:", v)
	default:
		fmt.Println("nothing ready yet")
	}

	select {
	case v := <-ch:
		fmt.Println("received:", v)
	case <-time.After(time.Second):
		fmt.Println("timeout")
	}
}
