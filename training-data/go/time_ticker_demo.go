package main

import (
	"fmt"
	"time"
)

func main() {
	ticker := time.NewTicker(20 * time.Millisecond)
	defer ticker.Stop()
	done := time.After(110 * time.Millisecond)

	count := 0
	for {
		select {
		case <-ticker.C:
			count++
			fmt.Println("tick", count)
		case <-done:
			fmt.Println("done after", count, "ticks")
			return
		}
	}
}
