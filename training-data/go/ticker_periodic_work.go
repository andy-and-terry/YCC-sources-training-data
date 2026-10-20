package main

import (
	"fmt"
	"time"
)

func main() {
	ticker := time.NewTicker(10 * time.Millisecond)
	defer ticker.Stop()
	done := time.After(55 * time.Millisecond)
	ticks := 0
	for {
		select {
		case <-ticker.C:
			ticks++
		case <-done:
			fmt.Println("ticks >= 4:", ticks >= 4)
			return
		}
	}
}
