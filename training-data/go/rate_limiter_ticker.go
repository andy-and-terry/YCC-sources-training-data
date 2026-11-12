package main

import (
	"fmt"
	"time"
)

func main() {
	tick := time.NewTicker(5 * time.Millisecond)
	defer tick.Stop()
	start := time.Now()
	for i := 1; i <= 3; i++ {
		<-tick.C
		fmt.Println("req", i)
	}
	fmt.Println(time.Since(start) >= 15*time.Millisecond)
}
