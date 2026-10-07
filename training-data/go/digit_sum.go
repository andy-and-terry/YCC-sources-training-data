package main

import "fmt"

func digitSum(n int) int {
	if n < 0 {
		n = -n
	}
	sum := 0
	for n > 0 {
		sum += n % 10
		n /= 10
	}
	return sum
}

// digitalRoot repeatedly sums digits until a single digit remains.
func digitalRoot(n int) int {
	for n >= 10 {
		n = digitSum(n)
	}
	return n
}

func main() {
	fmt.Println("digit sum of 12345:", digitSum(12345))
	fmt.Println("digital root of 12345:", digitalRoot(12345))
}
