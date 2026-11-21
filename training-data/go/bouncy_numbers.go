package main

import "fmt"

// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
func isBouncy(n int) bool {
	inc, dec := true, true
	prev := n % 10
	for m := n / 10; m > 0; m /= 10 {
		d := m % 10
		if d > prev {
			inc = false
		}
		if d < prev {
			dec = false
		}
		prev = d
	}
	return !inc && !dec
}

func main() {
	count := 0
	for n := 1; n < 1000; n++ {
		if isBouncy(n) {
			count++
		}
	}
	fmt.Println(count)
}
