package main

import (
	"fmt"
	"time"
)

func main() {
	tasks := make(chan string, 3)
	priority := make(chan string, 1)

	tasks <- "task 1"
	tasks <- "task 2"
	priority <- "urgent task"

	for i := 0; i < 3; i++ {
		select {
		case p := <-priority:
			fmt.Println("handling:", p)
		case t := <-tasks:
			fmt.Println("handling:", t)
		default:
			fmt.Println("nothing ready")
		}
	}

	timeout := time.After(10 * time.Millisecond)
	slow := make(chan string)
	go func() {
		time.Sleep(30 * time.Millisecond)
		slow <- "slow result"
	}()

	select {
	case res := <-slow:
		fmt.Println(res)
	case <-timeout:
		fmt.Println("timed out waiting for slow result")
	}
}
