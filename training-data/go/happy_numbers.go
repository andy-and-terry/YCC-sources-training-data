package main

import "fmt"

func digitSquareSum(n int) int {
	s := 0
	for ; n > 0; n /= 10 {
		d := n % 10
		s += d * d
	}
	return s
}

func isHappy(n int) bool {
	seen := map[int]bool{}
	for n != 1 && !seen[n] {
		seen[n] = true
		n = digitSquareSum(n)
	}
	return n == 1
}

func main() {
	for n, c := 1, 0; c < 8; n++ {
		if isHappy(n) {
			fmt.Print(n, " ")
			c++
		}
	}
	fmt.Println() // 1 7 10 13 19 23 28 31
}
