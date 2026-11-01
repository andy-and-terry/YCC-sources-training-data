package main

import (
	"fmt"
	"strconv"
)

func reverse(n int64) int64 {
	var r int64
	for ; n > 0; n /= 10 {
		r = r*10 + n%10
	}
	return r
}

// Reverse-and-add until a palindrome; count the steps.
func steps(n int64) int {
	for count := 0; count < 50; count++ {
		if count > 0 && n == reverse(n) {
			return count
		}
		n += reverse(n)
	}
	return -1
}

func main() {
	for _, n := range []int64{56, 57, 59, 79, 89} {
		fmt.Print(strconv.Itoa(steps(n)), " ")
	}
	fmt.Println()
}
