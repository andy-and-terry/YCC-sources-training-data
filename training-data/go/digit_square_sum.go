package main

import "fmt"

func digitSquareSum(n int) int {
	if n < 0 {
		n = -n
	}
	sum := 0
	for ; n > 0; n /= 10 {
		d := n % 10
		sum += d * d
	}
	return sum
}

func main() {
	fmt.Println(digitSquareSum(123))
	fmt.Println(digitSquareSum(-99))
}
