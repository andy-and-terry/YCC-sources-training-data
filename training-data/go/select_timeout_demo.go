package main

import (
	"fmt"
	"time"
)

func slowWork(d time.Duration) <-chan string {
	ch := make(chan string, 1)
	go func() {
		time.Sleep(d)
		ch <- fmt.Sprintf("done after %v", d)
	}()
	return ch
}

func main() {
	for _, d := range []time.Duration{10 * time.Millisecond, 300 * time.Millisecond} {
		select {
		case res := <-slowWork(d):
			fmt.Println(res)
		case <-time.After(100 * time.Millisecond):
			fmt.Println("timeout waiting for", d)
		}
	}

	ticker := time.NewTicker(20 * time.Millisecond)
	defer ticker.Stop()
	for i := 0; i < 3; i++ {
		<-ticker.C
		fmt.Println("tick", i)
	}
}
