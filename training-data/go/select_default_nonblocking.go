package main

import "fmt"

func trySend(ch chan int, v int) bool {
	select {
	case ch <- v:
		return true
	default:
		return false
	}
}

func tryRecv(ch chan int) (int, bool) {
	select {
	case v := <-ch:
		return v, true
	default:
		return 0, false
	}
}

func main() {
	ch := make(chan int, 2)
	for i := 1; i <= 3; i++ {
		fmt.Printf("send %d ok=%v\n", i, trySend(ch, i))
	}
	for i := 0; i < 3; i++ {
		v, ok := tryRecv(ch)
		fmt.Println("recv", v, ok)
	}
}
