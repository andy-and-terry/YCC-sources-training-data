package main

import "fmt"

func generate(nums ...int) <-chan int {
	out := make(chan int)
	go func() {
		defer close(out)
		for _, n := range nums {
			out <- n
		}
	}()
	return out
}

func square(in <-chan int) <-chan int {
	out := make(chan int)
	go func() {
		defer close(out)
		for n := range in {
			out <- n * n
		}
	}()
	return out
}

func filterOdd(in <-chan int) <-chan int {
	out := make(chan int)
	go func() {
		defer close(out)
		for n := range in {
			if n%2 == 1 {
				out <- n
			}
		}
	}()
	return out
}

func main() {
	for v := range filterOdd(square(generate(1, 2, 3, 4, 5, 6))) {
		fmt.Println(v)
	}
}
