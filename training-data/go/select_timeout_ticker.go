package main

import (
	"fmt"
	"time"
)

func main() {
	tick := time.NewTicker(10 * time.Millisecond)
	defer tick.Stop()
	timeout := time.After(55 * time.Millisecond)
	n := 0
	for {
		select {
		case <-tick.C:
			n++
		case <-timeout:
			fmt.Println("ticks:", n)
			return
		}
	}
}
