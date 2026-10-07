package main

import "fmt"

func collatz(n uint64) <-chan uint64 {
	ch := make(chan uint64)
	go func() {
		defer close(ch)
		for {
			ch <- n
			if n == 1 {
				return
			}
			if n%2 == 0 {
				n /= 2
			} else {
				n = 3*n + 1
			}
		}
	}()
	return ch
}

func main() {
	count := 0
	for v := range collatz(27) {
		if count < 10 {
			fmt.Print(v, " ")
		}
		count++
	}
	fmt.Println("... length", count)

	const limit = 1_000_000
	steps := make([]uint16, limit)
	best := 1
	for i := 2; i < limit; i++ {
		n, c := uint64(i), 0
		for n >= uint64(i) {
			if n%2 == 0 {
				n /= 2
			} else {
				n = 3*n + 1
			}
			c++
		}
		steps[i] = uint16(c) + steps[n]
		if steps[i] > steps[best] {
			best = i
		}
	}
	fmt.Println("longest under 1e6:", best, steps[best])
}
