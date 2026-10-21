package main

import "fmt"

func lucas(ch chan<- int, count int) {
	a, b := 2, 1
	for i := 0; i < count; i++ {
		ch <- a
		a, b = b, a+b
	}
	close(ch)
}

func main() {
	ch := make(chan int)
	go lucas(ch, 10)
	for v := range ch {
		fmt.Print(v, " ")
	}
	fmt.Println()
}
