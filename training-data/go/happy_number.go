package main

import "fmt"

func next(n int) int {
	s := 0
	for ; n > 0; n /= 10 {
		d := n % 10
		s += d * d
	}
	return s
}

func isHappy(n int) bool {
	slow, fast := n, next(n)
	for fast != 1 && slow != fast {
		slow, fast = next(slow), next(next(fast))
	}
	return fast == 1
}

func main() {
	var happy []int
	for i := 1; i <= 50; i++ {
		if isHappy(i) {
			happy = append(happy, i)
		}
	}
	fmt.Println(happy)
}
