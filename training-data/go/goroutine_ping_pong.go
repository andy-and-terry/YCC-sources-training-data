package main

import (
	"fmt"
	"sync"
)

func main() {
	ping := make(chan int)
	pong := make(chan int)
	var wg sync.WaitGroup
	wg.Add(1)

	go func() {
		defer wg.Done()
		for v := range ping {
			fmt.Println("pong got", v)
			pong <- v + 1
		}
		close(pong)
	}()

	v := 0
	for i := 0; i < 3; i++ {
		ping <- v
		v = <-pong
		fmt.Println("ping got", v)
	}
	close(ping)
	wg.Wait()
	_, ok := <-pong
	fmt.Println("pong open:", ok)
}
