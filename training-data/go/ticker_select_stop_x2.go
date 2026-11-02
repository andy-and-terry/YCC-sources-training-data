package main

import (
	"fmt"
	"time"
)

func main() {
	t := time.NewTicker(5 * time.Millisecond)
	defer t.Stop()
	done := time.After(22 * time.Millisecond)
	n := 0
	for {
		select {
		case <-t.C:
			n++
		case <-done:
			fmt.Println(n >= 3)
			return
		}
	}
}
