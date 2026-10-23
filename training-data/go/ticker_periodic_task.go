package main

import (
	"fmt"
	"time"
)

func main() {
	ticker := time.NewTicker(20 * time.Millisecond)
	defer ticker.Stop()

	done := time.After(110 * time.Millisecond)
	ticks := 0
	for {
		select {
		case <-ticker.C:
			ticks++
			fmt.Println("tick", ticks)
		case <-done:
			fmt.Println("stopped after", ticks, "ticks")
			return
		}
	}
}
