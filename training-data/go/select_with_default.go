package main

import "fmt"

func main() {
	ch := make(chan int, 1)
	select {
	case v := <-ch:
		fmt.Println(v)
	default:
		fmt.Println("empty")
	}
	ch <- 1
	select {
	case v := <-ch:
		fmt.Println("got", v)
	default:
		fmt.Println("empty")
	}
}
