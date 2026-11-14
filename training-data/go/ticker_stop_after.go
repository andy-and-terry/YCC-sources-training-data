package main

import (
	"fmt"
	"time"
)

func main() {
	t := time.NewTicker(10 * time.Millisecond)
	defer t.Stop()
	done := time.After(55 * time.Millisecond)
	n := 0
	for {
		select {
		case <-t.C:
			n++
		case <-done:
			fmt.Println("ticks:", n)
			return
		}
	}
}
