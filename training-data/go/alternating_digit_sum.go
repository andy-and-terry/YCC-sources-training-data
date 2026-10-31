package main

import "fmt"

func alternatingDigitSum(n int) int {
	total, sign := 0, 1
	for n > 0 {
		total += sign * (n % 10)
		sign = -sign
		n /= 10
	}
	return total
}

func main() {
	for _, n := range []int{1234, 99999, 1000} {
		fmt.Println(n, alternatingDigitSum(n))
	}
}
